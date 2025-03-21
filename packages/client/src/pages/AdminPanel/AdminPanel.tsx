import { useEntityQuery } from "@latticexyz/react";
import { getComponentValueStrict, Has } from "@latticexyz/recs";
import { useState } from "react";
import { useMUD } from "../../MUDContext";
import { Table } from "../../components/utils/Table.tsx/Table";
import { formatEntity } from "../../mud/utils/formatEntity";

const AdminPanel = () => {
  const { components } = useMUD();
  const { AffixPrototype } = components;
  const affixPrototypeEntities = useEntityQuery([Has(AffixPrototype)]);
  const [sortConfig, setSortConfig] = useState<{
    key: string;
    direction: "asc" | "desc";
  } | null>(null);

  const handleSort = (key: string) => {
    setSortConfig((prev) => {
      if (prev?.key === key) {
        return { key, direction: prev.direction === "asc" ? "desc" : "asc" };
      }
      return { key, direction: "asc" };
    });
  };

  const sortedEntities = [...affixPrototypeEntities].sort((a, b) => {
    if (!sortConfig) return 0;
    const affixA = getComponentValueStrict(AffixPrototype, a);
    const affixB = getComponentValueStrict(AffixPrototype, b);
    const valueA = affixA[sortConfig.key] ?? "";
    const valueB = affixB[sortConfig.key] ?? "";

    if (valueA < valueB) return sortConfig.direction === "asc" ? -1 : 1;
    if (valueA > valueB) return sortConfig.direction === "asc" ? 1 : -1;
    return 0;
  });

  const columns = [
    { key: "entity", label: "Entity" },
    { key: "name", label: "name" },
    { key: "affixTier", label: "affixTier" },
    { key: "exclusiveGroup", label: "exclusiveGroup" },
  ];

  const data = sortedEntities.map((entity) => {
    const affixProtoData = getComponentValueStrict(AffixPrototype, entity);
    return {
      entity: (
        <span
          className="hover:underline cursor-pointer"
          onClick={() => navigator.clipboard.writeText(entity)}
        >
          {formatEntity(entity)}
        </span>
      ),
      name: affixProtoData.name,
      affixTier: affixProtoData.affixTier,
      exclusiveGroup: (
        <span
          className="hover:underline cursor-pointer"
          onClick={() =>
            navigator.clipboard.writeText(affixProtoData.exclusiveGroup)
          }
        >
          {formatEntity(affixProtoData.exclusiveGroup)}
        </span>
      ),
    };
  });

  return (
    <section className="flex flex-col mx-5 md:mx-10">
      <h2 className="text-2xl text-dark-comment m-2">
        {"// Affix Prototypes"}
      </h2>
      <div className="overflow-x-auto">
        <Table columns={columns} data={data} onSort={handleSort} />
      </div>
    </section>
  );
};

export default AdminPanel;
