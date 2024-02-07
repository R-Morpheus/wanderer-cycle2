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

// Import user types
import { SkillType, TargetType } from "./../common.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("SkillTemplate")))
);
ResourceId constant SkillTemplateTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0009060001010101040100000000000000000000000000000000000000000000
);

struct SkillTemplateData {
  uint8 requiredLevel;
  SkillType skillType;
  bool withAttack;
  bool withSpell;
  uint32 cost;
  TargetType targetType;
}

library SkillTemplate {
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
    SchemaType[] memory _valueSchema = new SchemaType[](6);
    _valueSchema[0] = SchemaType.UINT8;
    _valueSchema[1] = SchemaType.UINT8;
    _valueSchema[2] = SchemaType.BOOL;
    _valueSchema[3] = SchemaType.BOOL;
    _valueSchema[4] = SchemaType.UINT32;
    _valueSchema[5] = SchemaType.UINT8;

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
    fieldNames = new string[](6);
    fieldNames[0] = "requiredLevel";
    fieldNames[1] = "skillType";
    fieldNames[2] = "withAttack";
    fieldNames[3] = "withSpell";
    fieldNames[4] = "cost";
    fieldNames[5] = "targetType";
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
   * @notice Get requiredLevel.
   */
  function getRequiredLevel(bytes32 entity) internal view returns (uint8 requiredLevel) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get requiredLevel.
   */
  function _getRequiredLevel(bytes32 entity) internal view returns (uint8 requiredLevel) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set requiredLevel.
   */
  function setRequiredLevel(bytes32 entity, uint8 requiredLevel) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((requiredLevel)), _fieldLayout);
  }

  /**
   * @notice Set requiredLevel.
   */
  function _setRequiredLevel(bytes32 entity, uint8 requiredLevel) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((requiredLevel)), _fieldLayout);
  }

  /**
   * @notice Get skillType.
   */
  function getSkillType(bytes32 entity) internal view returns (SkillType skillType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return SkillType(uint8(bytes1(_blob)));
  }

  /**
   * @notice Get skillType.
   */
  function _getSkillType(bytes32 entity) internal view returns (SkillType skillType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return SkillType(uint8(bytes1(_blob)));
  }

  /**
   * @notice Set skillType.
   */
  function setSkillType(bytes32 entity, SkillType skillType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked(uint8(skillType)), _fieldLayout);
  }

  /**
   * @notice Set skillType.
   */
  function _setSkillType(bytes32 entity, SkillType skillType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked(uint8(skillType)), _fieldLayout);
  }

  /**
   * @notice Get withAttack.
   */
  function getWithAttack(bytes32 entity) internal view returns (bool withAttack) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get withAttack.
   */
  function _getWithAttack(bytes32 entity) internal view returns (bool withAttack) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set withAttack.
   */
  function setWithAttack(bytes32 entity, bool withAttack) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((withAttack)), _fieldLayout);
  }

  /**
   * @notice Set withAttack.
   */
  function _setWithAttack(bytes32 entity, bool withAttack) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((withAttack)), _fieldLayout);
  }

  /**
   * @notice Get withSpell.
   */
  function getWithSpell(bytes32 entity) internal view returns (bool withSpell) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get withSpell.
   */
  function _getWithSpell(bytes32 entity) internal view returns (bool withSpell) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set withSpell.
   */
  function setWithSpell(bytes32 entity, bool withSpell) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((withSpell)), _fieldLayout);
  }

  /**
   * @notice Set withSpell.
   */
  function _setWithSpell(bytes32 entity, bool withSpell) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((withSpell)), _fieldLayout);
  }

  /**
   * @notice Get cost.
   */
  function getCost(bytes32 entity) internal view returns (uint32 cost) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get cost.
   */
  function _getCost(bytes32 entity) internal view returns (uint32 cost) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set cost.
   */
  function setCost(bytes32 entity, uint32 cost) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((cost)), _fieldLayout);
  }

  /**
   * @notice Set cost.
   */
  function _setCost(bytes32 entity, uint32 cost) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((cost)), _fieldLayout);
  }

  /**
   * @notice Get targetType.
   */
  function getTargetType(bytes32 entity) internal view returns (TargetType targetType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return TargetType(uint8(bytes1(_blob)));
  }

  /**
   * @notice Get targetType.
   */
  function _getTargetType(bytes32 entity) internal view returns (TargetType targetType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return TargetType(uint8(bytes1(_blob)));
  }

  /**
   * @notice Set targetType.
   */
  function setTargetType(bytes32 entity, TargetType targetType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked(uint8(targetType)), _fieldLayout);
  }

  /**
   * @notice Set targetType.
   */
  function _setTargetType(bytes32 entity, TargetType targetType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked(uint8(targetType)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(bytes32 entity) internal view returns (SkillTemplateData memory _table) {
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
  function _get(bytes32 entity) internal view returns (SkillTemplateData memory _table) {
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
    uint8 requiredLevel,
    SkillType skillType,
    bool withAttack,
    bool withSpell,
    uint32 cost,
    TargetType targetType
  ) internal {
    bytes memory _staticData = encodeStatic(requiredLevel, skillType, withAttack, withSpell, cost, targetType);

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
    uint8 requiredLevel,
    SkillType skillType,
    bool withAttack,
    bool withSpell,
    uint32 cost,
    TargetType targetType
  ) internal {
    bytes memory _staticData = encodeStatic(requiredLevel, skillType, withAttack, withSpell, cost, targetType);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 entity, SkillTemplateData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.requiredLevel,
      _table.skillType,
      _table.withAttack,
      _table.withSpell,
      _table.cost,
      _table.targetType
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
  function _set(bytes32 entity, SkillTemplateData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.requiredLevel,
      _table.skillType,
      _table.withAttack,
      _table.withSpell,
      _table.cost,
      _table.targetType
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
  )
    internal
    pure
    returns (
      uint8 requiredLevel,
      SkillType skillType,
      bool withAttack,
      bool withSpell,
      uint32 cost,
      TargetType targetType
    )
  {
    requiredLevel = (uint8(Bytes.slice1(_blob, 0)));

    skillType = SkillType(uint8(Bytes.slice1(_blob, 1)));

    withAttack = (_toBool(uint8(Bytes.slice1(_blob, 2))));

    withSpell = (_toBool(uint8(Bytes.slice1(_blob, 3))));

    cost = (uint32(Bytes.slice4(_blob, 4)));

    targetType = TargetType(uint8(Bytes.slice1(_blob, 8)));
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
  ) internal pure returns (SkillTemplateData memory _table) {
    (
      _table.requiredLevel,
      _table.skillType,
      _table.withAttack,
      _table.withSpell,
      _table.cost,
      _table.targetType
    ) = decodeStatic(_staticData);
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
    uint8 requiredLevel,
    SkillType skillType,
    bool withAttack,
    bool withSpell,
    uint32 cost,
    TargetType targetType
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(requiredLevel, skillType, withAttack, withSpell, cost, targetType);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint8 requiredLevel,
    SkillType skillType,
    bool withAttack,
    bool withSpell,
    uint32 cost,
    TargetType targetType
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(requiredLevel, skillType, withAttack, withSpell, cost, targetType);

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

/**
 * @notice Cast a value to a bool.
 * @dev Boolean values are encoded as uint8 (1 = true, 0 = false), but Solidity doesn't allow casting between uint8 and bool.
 * @param value The uint8 value to convert.
 * @return result The boolean value.
 */
function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}