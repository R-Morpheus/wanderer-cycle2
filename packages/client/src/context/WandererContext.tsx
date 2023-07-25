import { useComponentValue } from "@latticexyz/react";
import { Entity } from "@latticexyz/recs/src/types";
import {
  createContext,
  ReactNode,
  useCallback,
  useContext,
  useMemo,
  useState,
} from "react";
import {
  CycleCombatRewardRequest,
  OnCombatResultData,
  useActiveCombat,
  useCycleCombatRewardRequests,
  useOnCombatResultEffect,
} from "../mud/hooks/combat";
import { useLearnCycleSkill } from "../mud/hooks/skill";
import { useLearnedSkillEntities } from "../mud/hooks/skill";
import { useMUD } from "../MUDContext";

type WandererContextType = {
  selectedWandererEntity?: Entity;
  selectWandererEntity: (wanderer: Entity | undefined) => void;
  cycleEntity?: Entity;
  previousCycleEntity?: Entity;
  enemyEntity?: Entity;
  combatRewardRequests: CycleCombatRewardRequest[];
  lastCombatResult?: OnCombatResultData;
  clearCombatResult: () => void;
  learnCycleSkill: ReturnType<typeof useLearnCycleSkill>;
  learnedSkillEntities: Entity[];
  wandererMode: boolean;
  toggleWandererMode: () => void;
};

const WandererContext = createContext<WandererContextType | undefined>(
  undefined
);

export const WandererProvider = (props: { children: ReactNode }) => {
  const currentValue = useContext(WandererContext);
  if (currentValue) throw new Error("WandererProvider can only be used once");

  const [selectedWandererEntity, selectWandererEntity] = useState<Entity>();
  const {
    world,
    components: { ActiveCycle, ActiveCyclePrevious },
  } = useMUD();

  // current cycle
  const activeCycle = useComponentValue(ActiveCycle, selectedWandererEntity);
  const cycleEntity = useMemo(() => {
    return activeCycle?.value
      ? world.entityToIndex.get(activeCycle.value)
      : undefined;
  }, [activeCycle, world]);
  // previous cycle
  const activeCyclePrevious = useComponentValue(
    ActiveCyclePrevious,
    selectedWandererEntity
  );
  const previousCycleEntity = useMemo(() => {
    return activeCyclePrevious?.value
      ? world.entityToIndex.get(activeCyclePrevious.value)
      : undefined;
  }, [activeCyclePrevious, world]);

  const enemyEntity = useActiveCombat(cycleEntity);

  const combatRewardRequests = useCycleCombatRewardRequests(cycleEntity);
  const [lastCombatResult, setLastCombatResult] =
    useState<OnCombatResultData>();
  const clearCombatResult = useCallback(
    () => setLastCombatResult(undefined),
    []
  );
  useOnCombatResultEffect(cycleEntity, setLastCombatResult);

  const learnCycleSkill = useLearnCycleSkill(selectedWandererEntity);
  const learnedSkillEntities = useLearnedSkillEntities(cycleEntity);

  const [wandererMode, setWandererMode] = useState(false);
  const toggleWandererMode = useCallback(
    () => setWandererMode((value) => !value),
    []
  );

  const value = {
    selectedWandererEntity,
    selectWandererEntity,
    cycleEntity,
    previousCycleEntity,
    enemyEntity,
    combatRewardRequests,
    lastCombatResult,
    clearCombatResult,
    learnedSkillEntities,
    learnCycleSkill,
    wandererMode,
    toggleWandererMode,
  };
  return (
    <WandererContext.Provider value={value}>
      {props.children}
    </WandererContext.Provider>
  );
};

export const useWandererContext = () => {
  const value = useContext(WandererContext);
  if (!value) throw new Error("Must be used within a WandererProvider");
  return value;
};
