// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { CycleEquipmentSystem } from "../../cycle/CycleEquipmentSystem.sol";
import { revertWithBytes } from "@latticexyz/world/src/revertWithBytes.sol";
import { IWorldCall } from "@latticexyz/world/src/IWorldKernel.sol";
import { SystemCall } from "@latticexyz/world/src/SystemCall.sol";
import { WorldContextConsumerLib } from "@latticexyz/world/src/WorldContext.sol";
import { Systems } from "@latticexyz/world/src/codegen/tables/Systems.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";

type CycleEquipmentSystemType is bytes32;

// equivalent to WorldResourceIdLib.encode({ typeId: RESOURCE_SYSTEM, namespace: "", name: "CycleEquipmentSy" }))
CycleEquipmentSystemType constant cycleEquipmentSystem = CycleEquipmentSystemType.wrap(
  0x737900000000000000000000000000004379636c6545717569706d656e745379
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
 * @title CycleEquipmentSystemLib
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @dev This library is automatically generated from the corresponding system contract. Do not edit manually.
 */
library CycleEquipmentSystemLib {
  error CycleEquipmentSystemLib_CallingFromRootSystem();
  error CycleEquipmentSystem_NotSlotOwner(bytes32 targetEntity, bytes32 slotEntity);
  error CycleEquipmentSystem_NotEquipmentOwner(bytes32 targetEntity, bytes32 equipmentEntity);

  function equip(
    CycleEquipmentSystemType self,
    bytes32 cycleEntity,
    bytes32 slotEntity,
    bytes32 equipmentEntity
  ) internal {
    return CallWrapper(self.toResourceId(), address(0)).equip(cycleEntity, slotEntity, equipmentEntity);
  }

  function unequip(CycleEquipmentSystemType self, bytes32 cycleEntity, bytes32 slotEntity) internal {
    return CallWrapper(self.toResourceId(), address(0)).unequip(cycleEntity, slotEntity);
  }

  function equip(CallWrapper memory self, bytes32 cycleEntity, bytes32 slotEntity, bytes32 equipmentEntity) internal {
    // if the contract calling this function is a root system, it should use `callAsRoot`
    if (address(_world()) == address(this)) revert CycleEquipmentSystemLib_CallingFromRootSystem();

    bytes memory systemCall = abi.encodeCall(
      _equip_bytes32_bytes32_bytes32.equip,
      (cycleEntity, slotEntity, equipmentEntity)
    );
    self.from == address(0)
      ? _world().call(self.systemId, systemCall)
      : _world().callFrom(self.from, self.systemId, systemCall);
  }

  function unequip(CallWrapper memory self, bytes32 cycleEntity, bytes32 slotEntity) internal {
    // if the contract calling this function is a root system, it should use `callAsRoot`
    if (address(_world()) == address(this)) revert CycleEquipmentSystemLib_CallingFromRootSystem();

    bytes memory systemCall = abi.encodeCall(_unequip_bytes32_bytes32.unequip, (cycleEntity, slotEntity));
    self.from == address(0)
      ? _world().call(self.systemId, systemCall)
      : _world().callFrom(self.from, self.systemId, systemCall);
  }

  function equip(
    RootCallWrapper memory self,
    bytes32 cycleEntity,
    bytes32 slotEntity,
    bytes32 equipmentEntity
  ) internal {
    bytes memory systemCall = abi.encodeCall(
      _equip_bytes32_bytes32_bytes32.equip,
      (cycleEntity, slotEntity, equipmentEntity)
    );
    SystemCall.callWithHooksOrRevert(self.from, self.systemId, systemCall, msg.value);
  }

  function unequip(RootCallWrapper memory self, bytes32 cycleEntity, bytes32 slotEntity) internal {
    bytes memory systemCall = abi.encodeCall(_unequip_bytes32_bytes32.unequip, (cycleEntity, slotEntity));
    SystemCall.callWithHooksOrRevert(self.from, self.systemId, systemCall, msg.value);
  }

  function callFrom(CycleEquipmentSystemType self, address from) internal pure returns (CallWrapper memory) {
    return CallWrapper(self.toResourceId(), from);
  }

  function callAsRoot(CycleEquipmentSystemType self) internal view returns (RootCallWrapper memory) {
    return RootCallWrapper(self.toResourceId(), WorldContextConsumerLib._msgSender());
  }

  function callAsRootFrom(CycleEquipmentSystemType self, address from) internal pure returns (RootCallWrapper memory) {
    return RootCallWrapper(self.toResourceId(), from);
  }

  function toResourceId(CycleEquipmentSystemType self) internal pure returns (ResourceId) {
    return ResourceId.wrap(CycleEquipmentSystemType.unwrap(self));
  }

  function fromResourceId(ResourceId resourceId) internal pure returns (CycleEquipmentSystemType) {
    return CycleEquipmentSystemType.wrap(resourceId.unwrap());
  }

  function getAddress(CycleEquipmentSystemType self) internal view returns (address) {
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

interface _equip_bytes32_bytes32_bytes32 {
  function equip(bytes32 cycleEntity, bytes32 slotEntity, bytes32 equipmentEntity) external;
}

interface _unequip_bytes32_bytes32 {
  function unequip(bytes32 cycleEntity, bytes32 slotEntity) external;
}

using CycleEquipmentSystemLib for CycleEquipmentSystemType global;
using CycleEquipmentSystemLib for CallWrapper global;
using CycleEquipmentSystemLib for RootCallWrapper global;
