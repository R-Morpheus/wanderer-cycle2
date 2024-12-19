import {
  Entity,
  getComponentValue,
  getComponentValueStrict,
  World,
} from "@latticexyz/recs";
import { SetupResult } from "../setup";
import { StatmodElement } from "./elemental";
import { Op } from "./op";

type GetStatmodPrototypeComponents = Pick<
  SetupResult["components"],
  "StatmodPrototype" | "Name" | "ReverseHashName"
>;

export function getStatmodPrototype(
  world: World,
  components: GetStatmodPrototypeComponents,
  entity: Entity,
) {
  const { StatmodPrototype, Name, ReverseHashName } = components;

  const statmodPrototype = getComponentValueStrict(StatmodPrototype, entity);

  const topicEntity = world.entityToIndex.get(statmodPrototype.topicEntity);
  const name = getComponentValueStrict(Name, entity);
  // TODO is topicName even needed?
  const topicName = topicEntity
    ? getComponentValue(ReverseHashName, topicEntity)?.value
    : undefined;

  return {
    entity,
    name: name.value,

    element: statmodPrototype.element as StatmodElement,
    op: statmodPrototype.op as Op,

    topicEntity,
    topicName,
  };
}
