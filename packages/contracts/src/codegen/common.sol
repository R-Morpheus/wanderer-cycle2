// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

enum EleStat {
  NONE,
  PHYSICAL,
  FIRE,
  COLD,
  POISON
}

enum SkillType {
  COMBAT,
  NONCOMBAT,
  PASSIVE
}

enum TargetType {
  SELF,
  ENEMY,
  ALLY,
  SELF_OR_ALLY
}

enum StatmodOp {
  ADD,
  MUL,
  BADD
}

enum AffixPartId {
  IMPLICIT,
  PREFIX,
  SUFFIX
}

enum CombatActionType {
  ATTACK,
  SKILL
}

enum CombatResult {
  NONE,
  VICTORY,
  DEFEAT
}
