import { Entity, getComponentValueStrict } from "@latticexyz/recs";
import { ClientComponents } from "../createClientComponents";
import { parseElementalArray } from "./elemental";
import { parseScopedDuration } from "./scopedDuration";

export type SkillData = ReturnType<typeof getSkill>;

export enum SkillType {
  COMBAT,
  NONCOMBAT,
  PASSIVE,
}

export const skillTypeNames = {
  [SkillType.COMBAT]: "combat",
  [SkillType.NONCOMBAT]: "noncombat",
  [SkillType.PASSIVE]: "passive",
};

export enum TargetType {
  SELF,
  ENEMY,
  ALLY,
  SELF_OR_ALLY,
}

export const targetTypeNames = {
  [TargetType.SELF]: "self",
  [TargetType.ENEMY]: "enemy",
  [TargetType.ALLY]: "ally",
  [TargetType.SELF_OR_ALLY]: "self or ally",
};

export const getSkill = (
  // world: World,
  components: ClientComponents,
  entity: Entity,
) => {
  const skill = getComponentValueStrict(components.SkillTemplate, entity);
  const description = getComponentValueStrict(
    components.SkillDescription,
    entity,
  );
  const name = getComponentValueStrict(components.Name, entity);
  const skillSpellDamage = getComponentValueStrict(
    components.SkillSpellDamage,
    entity,
  );
  const skillTemplateCooldown = getComponentValueStrict(
    components.SkillTemplateCooldown,
    entity,
  );
  const skillTemplateDuration = getComponentValueStrict(
    components.SkillTemplateDuration,
    entity,
  );

  const skillType = skill.skillType as SkillType;
  const effectTarget = skill.effectTarget as TargetType;

  return {
    entity,
    // entityId: world.entities[entity],
    name: name?.value ?? "",
    requiredLevel: skill.requiredLevel,
    skillType,
    skillTypeName: skillTypeNames[skillType],
    withAttack: skill.withAttack,
    withSpell: skill.withSpell,
    cost: skill.cost,
    duration: parseScopedDuration(
      skillTemplateDuration.timeId,
      skillTemplateDuration.timeValue.toString(),
    ),
    cooldown: parseScopedDuration(
      skillTemplateCooldown.timeId,
      skillTemplateCooldown.timeValue.toString(),
    ),
    effectTarget,
    effectTargetName: targetTypeNames[effectTarget],
    spellDamage: parseElementalArray(skillSpellDamage.value),

    description: description?.value ?? "",
  };
};
