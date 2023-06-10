// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MudV2Test } from "@latticexyz/std-contracts/src/test/MudV2Test.t.sol";
import { LibCycleTurns } from "../src/cycle/LibCycleTurns.sol";
import { CycleTurns, CycleTurnsLastClaimed, ActiveGuise, ActiveCycle } from "../src/codegen/Tables.sol";

contract LibExperienceTest is MudV2Test {
  bytes32 internal targetEntity = keccak256("targetEntity");
  bytes32 internal cycleEntity = keccak256("cycleEntity");

  uint32 initialTurns;

  function setUp() public virtual override {
    super.setUp();
    // TODO remove this if it's integrated into MUD
    vm.startPrank(worldAddress);
  }

  function test_setUp() public {
    initialTurns = CycleTurns.get(cycleEntity);
    // spawn should autoclaim the first turns batch
    assertEq(initialTurns, LibCycleTurns.TURNS_PER_PERIOD);
  }

  function test_claimTurns_premature() public {
    initialTurns = CycleTurns.get(cycleEntity);
    LibCycleTurns.claimTurns(cycleEntity);
    // trying to claim again prematurely should do nothing
    LibCycleTurns.claimTurns(cycleEntity);

    uint32 turns = CycleTurns.get(cycleEntity);
    assertEq(turns, initialTurns);
  }

  function test_claimTurns_secondPeriod() public {
    initialTurns = CycleTurns.get(cycleEntity);

    // after waiting for ACC_PERIOD, another batch should be claimable
    vm.warp(block.timestamp + LibCycleTurns.ACC_PERIOD);
    LibCycleTurns.claimTurns(cycleEntity);
    uint32 turns = CycleTurns.get(cycleEntity);
    assertEq(turns, initialTurns + LibCycleTurns.TURNS_PER_PERIOD);
  }

  function test_claimTurns_twoPeriods() public {
    initialTurns = CycleTurns.get(cycleEntity);

    // after waiting for 2 ACC_PERIODs, 2 batches should be claimable at once
    vm.warp(block.timestamp + 2 * LibCycleTurns.ACC_PERIOD);
    LibCycleTurns.claimTurns(cycleEntity);
    uint256 turns = CycleTurns.get(cycleEntity);
    assertEq(turns, initialTurns + 2 * LibCycleTurns.TURNS_PER_PERIOD);
  }

  function test_claimTurns_atMaxCurrent() public {
    initialTurns = CycleTurns.get(cycleEntity);
    vm.warp(block.timestamp + LibCycleTurns.ACC_PERIOD);

    uint32 maxCurrent = LibCycleTurns.MAX_CURRENT_TURNS_FOR_CLAIM;
    CycleTurns.set(cycleEntity, maxCurrent);
    // claim turns while at max, this should succeed
    LibCycleTurns.claimTurns(cycleEntity);
    uint256 turns = CycleTurns.get(cycleEntity);
    assertEq(turns, maxCurrent + LibCycleTurns.TURNS_PER_PERIOD);
  }

  function test_claimTurns_overMaxCurrent() public {
    initialTurns = CycleTurns.get(cycleEntity);
    vm.warp(block.timestamp + LibCycleTurns.ACC_PERIOD);

    uint32 maxCurrent = LibCycleTurns.MAX_CURRENT_TURNS_FOR_CLAIM;
    CycleTurns.set(cycleEntity, maxCurrent + 1);
    // claim turns while over max, this should do nothing (same as premature)
    LibCycleTurns.claimTurns(cycleEntity);
    uint256 turns = CycleTurns.get(cycleEntity);
    assertEq(turns, maxCurrent + 1);

    // reduce current turns to max
    CycleTurns.set(cycleEntity, LibCycleTurns.MAX_CURRENT_TURNS_FOR_CLAIM);
    // this should succeed (ensuring that the previous empty claim didn't remove potential claimable turns)
    LibCycleTurns.claimTurns(cycleEntity);
    turns = CycleTurns.get(cycleEntity);
    assertEq(turns, maxCurrent + LibCycleTurns.TURNS_PER_PERIOD);
  }
}
