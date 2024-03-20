// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { GenericDurationData, EffectDurationTableId, SkillCooldownTableId } from "./codegen/index.sol";
import { Duration } from "./modules/duration/Duration.sol";

library LibTime {
  function decreaseApplications(bytes32 targetEntity, GenericDurationData memory duration) internal {
    ResourceId[2] memory durationTableIds = [EffectDurationTableId, SkillCooldownTableId];
    for (uint256 i; i < durationTableIds.length; i++) {
      Duration.decreaseApplications(durationTableIds[i], targetEntity, duration);
    }
  }
}
