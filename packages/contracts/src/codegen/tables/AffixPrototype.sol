// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("AffixPrototype")))
);
ResourceId constant AffixPrototypeTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0030050020040404040000000000000000000000000000000000000000000000
);

struct AffixPrototypeData {
  bytes32 statmodProtoEntity;
  uint32 tier;
  uint32 requiredLevel;
  uint32 min;
  uint32 max;
}

library AffixPrototype {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](5);
    _valueSchema[0] = SchemaType.BYTES32;
    _valueSchema[1] = SchemaType.UINT32;
    _valueSchema[2] = SchemaType.UINT32;
    _valueSchema[3] = SchemaType.UINT32;
    _valueSchema[4] = SchemaType.UINT32;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "entity";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](5);
    fieldNames[0] = "statmodProtoEntity";
    fieldNames[1] = "tier";
    fieldNames[2] = "requiredLevel";
    fieldNames[3] = "min";
    fieldNames[4] = "max";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get statmodProtoEntity.
   */
  function getStatmodProtoEntity(bytes32 entity) internal view returns (bytes32 statmodProtoEntity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (bytes32(_blob));
  }

  /**
   * @notice Get statmodProtoEntity.
   */
  function _getStatmodProtoEntity(bytes32 entity) internal view returns (bytes32 statmodProtoEntity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (bytes32(_blob));
  }

  /**
   * @notice Set statmodProtoEntity.
   */
  function setStatmodProtoEntity(bytes32 entity, bytes32 statmodProtoEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((statmodProtoEntity)), _fieldLayout);
  }

  /**
   * @notice Set statmodProtoEntity.
   */
  function _setStatmodProtoEntity(bytes32 entity, bytes32 statmodProtoEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((statmodProtoEntity)), _fieldLayout);
  }

  /**
   * @notice Get tier.
   */
  function getTier(bytes32 entity) internal view returns (uint32 tier) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get tier.
   */
  function _getTier(bytes32 entity) internal view returns (uint32 tier) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set tier.
   */
  function setTier(bytes32 entity, uint32 tier) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((tier)), _fieldLayout);
  }

  /**
   * @notice Set tier.
   */
  function _setTier(bytes32 entity, uint32 tier) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((tier)), _fieldLayout);
  }

  /**
   * @notice Get requiredLevel.
   */
  function getRequiredLevel(bytes32 entity) internal view returns (uint32 requiredLevel) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get requiredLevel.
   */
  function _getRequiredLevel(bytes32 entity) internal view returns (uint32 requiredLevel) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set requiredLevel.
   */
  function setRequiredLevel(bytes32 entity, uint32 requiredLevel) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((requiredLevel)), _fieldLayout);
  }

  /**
   * @notice Set requiredLevel.
   */
  function _setRequiredLevel(bytes32 entity, uint32 requiredLevel) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((requiredLevel)), _fieldLayout);
  }

  /**
   * @notice Get min.
   */
  function getMin(bytes32 entity) internal view returns (uint32 min) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get min.
   */
  function _getMin(bytes32 entity) internal view returns (uint32 min) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set min.
   */
  function setMin(bytes32 entity, uint32 min) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((min)), _fieldLayout);
  }

  /**
   * @notice Set min.
   */
  function _setMin(bytes32 entity, uint32 min) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((min)), _fieldLayout);
  }

  /**
   * @notice Get max.
   */
  function getMax(bytes32 entity) internal view returns (uint32 max) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get max.
   */
  function _getMax(bytes32 entity) internal view returns (uint32 max) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set max.
   */
  function setMax(bytes32 entity, uint32 max) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((max)), _fieldLayout);
  }

  /**
   * @notice Set max.
   */
  function _setMax(bytes32 entity, uint32 max) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((max)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(bytes32 entity) internal view returns (AffixPrototypeData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(bytes32 entity) internal view returns (AffixPrototypeData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    bytes32 entity,
    bytes32 statmodProtoEntity,
    uint32 tier,
    uint32 requiredLevel,
    uint32 min,
    uint32 max
  ) internal {
    bytes memory _staticData = encodeStatic(statmodProtoEntity, tier, requiredLevel, min, max);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    bytes32 entity,
    bytes32 statmodProtoEntity,
    uint32 tier,
    uint32 requiredLevel,
    uint32 min,
    uint32 max
  ) internal {
    bytes memory _staticData = encodeStatic(statmodProtoEntity, tier, requiredLevel, min, max);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 entity, AffixPrototypeData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.statmodProtoEntity,
      _table.tier,
      _table.requiredLevel,
      _table.min,
      _table.max
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(bytes32 entity, AffixPrototypeData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.statmodProtoEntity,
      _table.tier,
      _table.requiredLevel,
      _table.min,
      _table.max
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (bytes32 statmodProtoEntity, uint32 tier, uint32 requiredLevel, uint32 min, uint32 max) {
    statmodProtoEntity = (Bytes.slice32(_blob, 0));

    tier = (uint32(Bytes.slice4(_blob, 32)));

    requiredLevel = (uint32(Bytes.slice4(_blob, 36)));

    min = (uint32(Bytes.slice4(_blob, 40)));

    max = (uint32(Bytes.slice4(_blob, 44)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (AffixPrototypeData memory _table) {
    (_table.statmodProtoEntity, _table.tier, _table.requiredLevel, _table.min, _table.max) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(bytes32 entity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(bytes32 entity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    bytes32 statmodProtoEntity,
    uint32 tier,
    uint32 requiredLevel,
    uint32 min,
    uint32 max
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(statmodProtoEntity, tier, requiredLevel, min, max);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    bytes32 statmodProtoEntity,
    uint32 tier,
    uint32 requiredLevel,
    uint32 min,
    uint32 max
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(statmodProtoEntity, tier, requiredLevel, min, max);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 entity) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    return _keyTuple;
  }
}