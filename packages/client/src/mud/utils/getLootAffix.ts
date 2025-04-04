import { Hex } from "viem";
import { getRecord, TableRecord } from "@latticexyz/stash/internal";
import { getRecordStrict, mudTables, StateLocal } from "../stash";

export enum AffixPartId {
  IMPLICIT,
  PREFIX,
  SUFFIX,
}

export interface LootAffix {
  affixPrototypeEntity: Hex;
  affixPrototype: TableRecord<(typeof mudTables)["affix__AffixPrototype"]>;
  partId: AffixPartId;
  value: number;
  naming: string;
}

export function getLootAffixes(
  state: StateLocal,
  affixAvailabilityTargetId: Hex,
  lootEntity: Hex,
) {
  const lootAffixes: LootAffix[] = [];

  const affixEntities = getRecordStrict({
    state,
    table: mudTables.root__LootAffixes,
    key: { entity: lootEntity },
  }).affixEntities;

  for (const affixEntity of affixEntities) {
    lootAffixes.push(
      getLootAffix(state, affixAvailabilityTargetId, affixEntity),
    );
  }

  return lootAffixes;
}

export function getLootAffix(
  state: StateLocal,
  affixAvailabilityTargetId: Hex,
  affixEntity: Hex,
): LootAffix {
  const affix = getRecordStrict({
    state,
    table: mudTables.affix__Affix,
    key: { entity: affixEntity },
  });

  const affixPrototypeEntity = affix.affixPrototypeEntity;
  const affixPrototype = getRecordStrict({
    state,
    table: mudTables.affix__AffixPrototype,
    key: { entity: affixPrototypeEntity },
  });

  const naming = getRecord({
    state,
    table: mudTables.affix__AffixNaming,
    key: {
      affixPart: affix.partId,
      targetId: affixAvailabilityTargetId,
      affixPrototypeEntity: affixPrototypeEntity,
    },
  });

  return {
    affixPrototypeEntity,
    affixPrototype,
    partId: affix.partId,
    value: affix.value,
    naming: naming?.label ?? "",
  };
}
