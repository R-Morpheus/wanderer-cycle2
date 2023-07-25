import { useCallback, useMemo, useState } from "react";
import CustomButton from "../UI/Button/CustomButton";
import { useGuises } from "../../mud/hooks/guise";
import { EntityIndex } from "@latticexyz/recs";
import { useStartCycle } from "../../mud/hooks/cycle";
import { useLearnedSkillEntities } from "../../mud/hooks/skill";
import SkillPermanent from "./SkillPermanent";
import Select from "react-select";
import "../UI/customSelect.scss";
import { useWheels } from "../../mud/hooks/wheel";

export function CycleStart({
  wandererEntity,
  previousCycleEntity,
}: {
  wandererEntity: EntityIndex;
  previousCycleEntity: EntityIndex;
}) {
  const startCycle = useStartCycle(wandererEntity);
  const learnedSkillEntities = useLearnedSkillEntities(previousCycleEntity);
  const guises = useGuises();
  const wheels = useWheels();

  const guiseOptions = useMemo(
    () => guises.map(({ name, entity }) => ({ value: entity, label: name })),
    [guises]
  );
  const wheelOptions = useMemo(
    () =>
      wheels.map(({ name, entity }) => ({ value: entity, label: name.value })),
    [wheels]
  );

  const [selectedGuise, selectGuise] = useState<
    (typeof guiseOptions)[number] | null
  >(null);
  const [selectedWheel, selectWheel] = useState<
    (typeof wheelOptions)[number] | null
  >(null);

  const onStart = useCallback(() => {
    if (selectedGuise === null) throw new Error("Invalid guise");
    if (selectedWheel === null) throw new Error("Invalid wheel");
    startCycle(selectedGuise.value, selectedWheel.value);
  }, [startCycle, selectedGuise, selectedWheel]);

  return (
    <div className="flex w-full justify-around">
      <div className="flex mt-10">
        {learnedSkillEntities.map((entity) => (
          <div key={entity} className="flex flex-col items center">
            <SkillPermanent entity={entity} />
          </div>
        ))}
      </div>
      <div className="flex flex-col items-center">
        <span className="text-2xl text-dark-comment mb-4">{"// start"}</span>
        <div className="border border-dark-400 p-3">
          <div className="flex w-96 mb-4 items-center justify-center">
            <span className="text-dark-string w-28 mr-2">select a guise</span>
            <Select
              value={selectedGuise}
              classNamePrefix={"custom-select"}
              options={guiseOptions}
              placeholder={"select a guise"}
              onChange={selectGuise}
            />
          </div>
          <div className="flex w-96 items-center justify-center">
            <span className="text-dark-string w-28 mr-2">select a wheel</span>
            <Select
              value={selectedWheel}
              classNamePrefix={"custom-select"}
              options={wheelOptions}
              placeholder={"select a wheel"}
              onChange={selectWheel}
            />
          </div>
          <div className="flex flex-col items-center text-start mt-4 border-t border-t-dark-400">
            <span className="text-dark-string">Reward</span>
            <span className="text-dark-key">
              identity: <span className="text-dark-number">128</span>
            </span>
            <span className="text-dark-key">
              used:{" "}
              <span className="text-dark-number">
                0 <span className="text-dark-method">/</span> 4
              </span>
            </span>
          </div>
          <div className="flex items-center justify-center mt-4">
            <CustomButton
              style={{ width: "9rem" }}
              onClick={onStart}
              disabled={selectedGuise === null || selectedWheel === null}
            >
              start
            </CustomButton>
          </div>
        </div>
      </div>
    </div>
  );
}
