// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";

import { GenericDurationData, SkillTemplate, SkillTemplateData, SkillTemplateCooldown, SkillTemplateDuration, SkillDescription, SkillNameToEntity, EffectTemplateData, Name } from "../codegen/index.sol";
import { LibEffectTemplate } from "../modules/effect/LibEffectTemplate.sol";
import { EleStat_length } from "../CustomTypes.sol";
import { LibSkill } from "../skill/LibSkill.sol";

library LibBaseInitSkill {
  function add(
    string memory name,
    string memory description,
    SkillTemplateData memory template,
    GenericDurationData memory cooldown,
    GenericDurationData memory duration,
    EffectTemplateData memory effectTemplate
  ) internal {
    bytes32 entity = getUniqueEntity();

    SkillTemplate.set(entity, template);
    LibSkill.setSkillTemplateCooldown(entity, cooldown);
    LibSkill.setSkillTemplateDuration(entity, duration);
    SkillDescription.set(entity, description);
    SkillNameToEntity.set(keccak256(bytes(name)), entity);
    Name.set(entity, name);

    // Given statmods, a skill will have an on-use effect template
    if (effectTemplate.entities.length > 0) {
      LibEffectTemplate.verifiedSet(entity, effectTemplate);
    }
  }

  function _noDuration() internal pure returns (GenericDurationData memory) {
    return GenericDurationData({ timeId: "", timeValue: 0 });
  }

  function _emptyElemental() internal pure returns (uint32[EleStat_length] memory) {
    return [uint32(0), 0, 0, 0, 0];
  }
}