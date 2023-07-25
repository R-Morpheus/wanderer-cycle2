import InventorySection from "./InventorySection";
import InventoryFilter from "./InventoryFilter";
import { useInventoryContext } from "../../contexts/InventoryContext";

export default function InventoryList() {
  const { equipmentList, presentProtoEntityIds, filter } =
    useInventoryContext();

  const separator = <hr className="h-px my-2 bg-dark-400 border-0 " />;
  return (
    <div className="w-[60%] flex flex-col ml-24">
      <div className="flex flex-wrap justify-start w-full m-2">
        <div className="text-2xl text-dark-comment mr-2">{"// inventory"}</div>
        <div className="flex w-full">
          <InventoryFilter />
        </div>
      </div>
      <div className="flex flex-col justify-center items-center">
        {presentProtoEntityIds.map((_protoEntityId) => (
          <div key={_protoEntityId} className="w-full">
            <div
              key={_protoEntityId}
              className={
                !filter
                  ? "flex flex-col justify-start w-full flex-wrap"
                  : "flex flex-col justify-center flex-wrap"
              }
            >
              <InventorySection
                protoEntityId={_protoEntityId}
                equipmentList={equipmentList.filter(
                  ({ protoEntityId }) => protoEntityId === _protoEntityId
                )}
              />
            </div>
            {separator}
          </div>
        ))}
      </div>
    </div>
  );
}
