// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";

import { LibInitStatmod } from "../src/init/LibInitStatmod.sol";
import { LibInitSkill } from "../src/init/LibInitSkill.sol";
import { LibInitGuise } from "../src/init/LibInitGuise.sol";
import { LibInitWheel } from "../src/init/LibInitWheel.sol";
import { LibInitERC721 } from "../src/init/LibInitERC721.sol";

contract PostDeploy is Script {
  function run(address worldAddress) external {
    // Specify a store so that you can use tables directly in PostDeploy
    StoreSwitch.setStoreAddress(worldAddress);

    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // Start broadcasting transactions from the deployer account
    vm.startBroadcast(deployerPrivateKey);

    LibInitStatmod.init();
    LibInitSkill.init();
    LibInitGuise.init();
    LibInitWheel.init();
    LibInitERC721.init();

    vm.stopBroadcast();
  }
}
