// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { CycleActivateCombatSystem } from "../../cycle/CycleActivateCombatSystem.sol";
import { MapType } from "../../map/MapType.sol";
import { revertWithBytes } from "@latticexyz/world/src/revertWithBytes.sol";
import { IWorldCall } from "@latticexyz/world/src/IWorldKernel.sol";
import { SystemCall } from "@latticexyz/world/src/SystemCall.sol";
import { WorldContextConsumerLib } from "@latticexyz/world/src/WorldContext.sol";
import { Systems } from "@latticexyz/world/src/codegen/tables/Systems.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";

type CycleActivateCombatSystemType is bytes32;

// equivalent to WorldResourceIdLib.encode({ typeId: RESOURCE_SYSTEM, namespace: "", name: "CycleActivateCom" }))
CycleActivateCombatSystemType constant cycleActivateCombatSystem = CycleActivateCombatSystemType.wrap(
  0x737900000000000000000000000000004379636c654163746976617465436f6d
);

struct CallWrapper {
  ResourceId systemId;
  address from;
}

struct RootCallWrapper {
  ResourceId systemId;
  address from;
}

/**
 * @title CycleActivateCombatSystemLib
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @dev This library is automatically generated from the corresponding system contract. Do not edit manually.
 */
library CycleActivateCombatSystemLib {
  error CycleActivateCombatSystemLib_CallingFromRootSystem();
  error CycleActivateCombatSystem_InvalidMapType(bytes32 mapEntity, MapType mapType);
  error CycleActivateCombatSystem_BossMapAlreadyCleared();

  function activateCycleCombat(
    CycleActivateCombatSystemType self,
    bytes32 cycleEntity,
    bytes32 mapEntity
  ) internal returns (bytes32 encounterEntity) {
    return CallWrapper(self.toResourceId(), address(0)).activateCycleCombat(cycleEntity, mapEntity);
  }

  function activateCycleCombat(
    CallWrapper memory self,
    bytes32 cycleEntity,
    bytes32 mapEntity
  ) internal returns (bytes32 encounterEntity) {
    // if the contract calling this function is a root system, it should use `callAsRoot`
    if (address(_world()) == address(this)) revert CycleActivateCombatSystemLib_CallingFromRootSystem();

    bytes memory systemCall = abi.encodeCall(
      _activateCycleCombat_bytes32_bytes32.activateCycleCombat,
      (cycleEntity, mapEntity)
    );

    bytes memory result = self.from == address(0)
      ? _world().call(self.systemId, systemCall)
      : _world().callFrom(self.from, self.systemId, systemCall);
    return abi.decode(result, (bytes32));
  }

  function activateCycleCombat(
    RootCallWrapper memory self,
    bytes32 cycleEntity,
    bytes32 mapEntity
  ) internal returns (bytes32 encounterEntity) {
    bytes memory systemCall = abi.encodeCall(
      _activateCycleCombat_bytes32_bytes32.activateCycleCombat,
      (cycleEntity, mapEntity)
    );

    bytes memory result = SystemCall.callWithHooksOrRevert(self.from, self.systemId, systemCall, msg.value);
    return abi.decode(result, (bytes32));
  }

  function callFrom(CycleActivateCombatSystemType self, address from) internal pure returns (CallWrapper memory) {
    return CallWrapper(self.toResourceId(), from);
  }

  function callAsRoot(CycleActivateCombatSystemType self) internal view returns (RootCallWrapper memory) {
    return RootCallWrapper(self.toResourceId(), WorldContextConsumerLib._msgSender());
  }

  function callAsRootFrom(
    CycleActivateCombatSystemType self,
    address from
  ) internal pure returns (RootCallWrapper memory) {
    return RootCallWrapper(self.toResourceId(), from);
  }

  function toResourceId(CycleActivateCombatSystemType self) internal pure returns (ResourceId) {
    return ResourceId.wrap(CycleActivateCombatSystemType.unwrap(self));
  }

  function fromResourceId(ResourceId resourceId) internal pure returns (CycleActivateCombatSystemType) {
    return CycleActivateCombatSystemType.wrap(resourceId.unwrap());
  }

  function getAddress(CycleActivateCombatSystemType self) internal view returns (address) {
    return Systems.getSystem(self.toResourceId());
  }

  function _world() private view returns (IWorldCall) {
    return IWorldCall(StoreSwitch.getStoreAddress());
  }
}

/**
 * System Function Interfaces
 *
 * We generate an interface for each system function, which is then used for encoding system calls.
 * This is necessary to handle function overloading correctly (which abi.encodeCall cannot).
 *
 * Each interface is uniquely named based on the function name and parameters to prevent collisions.
 */

interface _activateCycleCombat_bytes32_bytes32 {
  function activateCycleCombat(bytes32 cycleEntity, bytes32 mapEntity) external;
}

using CycleActivateCombatSystemLib for CycleActivateCombatSystemType global;
using CycleActivateCombatSystemLib for CallWrapper global;
using CycleActivateCombatSystemLib for RootCallWrapper global;
