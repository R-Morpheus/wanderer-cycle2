// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";

import { EffectTemplateData, LootAffixes, LootIlvl, Affix, AffixData } from "../codegen/index.sol";
import { AffixPartId } from "../codegen/common.sol";

import { LibPickAffix } from "../affix/LibPickAffix.sol";
import { LibEffectTemplate } from "../modules/effect/LibEffectTemplate.sol";

library LibLootMint {
  function randomLootMint(
    AffixPartId[] memory affixPartIds,
    bytes32 lootEntity,
    bytes32 targetEntity,
    uint32 ilvl,
    uint256 randomness
  ) internal {
    bytes32[] memory excludeAffixes;
    randomLootMint(affixPartIds, excludeAffixes, lootEntity, targetEntity, ilvl, randomness);
  }

  function randomLootMint(
    AffixPartId[] memory affixPartIds,
    bytes32[] memory excludeAffixes,
    bytes32 lootEntity,
    bytes32 targetEntity,
    uint32 ilvl,
    uint256 randomness
  ) internal {
    // pick affixes
    (
      bytes32[] memory statmodProtoEntities,
      bytes32[] memory affixProtoEntities,
      uint32[] memory affixValues
    ) = LibPickAffix.pickAffixes(affixPartIds, excludeAffixes, targetEntity, ilvl, randomness);
    // mint picked affixes
    lootMint(lootEntity, ilvl, affixPartIds, statmodProtoEntities, affixProtoEntities, affixValues);
  }

  function lootMint(
    bytes32 lootEntity,
    uint32 ilvl,
    AffixPartId[] memory affixPartIds,
    bytes32[] memory statmodProtoEntities,
    bytes32[] memory affixProtoEntities,
    uint32[] memory affixValues
  ) internal {
    bytes32[] memory affixEntities = new bytes32[](affixPartIds.length);
    for (uint256 i; i < affixPartIds.length; i++) {
      bytes32 affixEntity = getUniqueEntity();
      Affix.set(affixEntity, affixPartIds[i], affixProtoEntities[i], affixValues[i]);
      affixEntities[i] = affixEntity;
    }
    // save loot-specific data
    LootAffixes.set(lootEntity, affixEntities);
    LootIlvl.set(lootEntity, ilvl);
    // save loot as an effect prototype (the effect triggers on-equip)
    LibEffectTemplate.verifiedSet(
      lootEntity,
      EffectTemplateData({ entities: statmodProtoEntities, values: affixValues })
    );
  }
}
