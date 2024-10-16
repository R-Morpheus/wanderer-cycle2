// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { EncodedLengths, EncodedLengthsLib } from "@latticexyz/store/src/EncodedLengths.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

// Import user types
import { StatmodTopic } from "../../modules/statmod/StatmodTopic.sol";
import { StatmodOp, EleStat } from "../common.sol";

struct StatmodBaseData {
  StatmodTopic statmodTopic;
  StatmodOp statmodOp;
  EleStat eleStat;
}

library StatmodBase {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "StatmodBase", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x74620000000000000000000000000000537461746d6f64426173650000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0022030020010100000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (bytes32)
  Schema constant _keySchema = Schema.wrap(0x002001005f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bytes32, uint8, uint8)
  Schema constant _valueSchema = Schema.wrap(0x002203005f000000000000000000000000000000000000000000000000000000);

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
    fieldNames = new string[](3);
    fieldNames[0] = "statmodTopic";
    fieldNames[1] = "statmodOp";
    fieldNames[2] = "eleStat";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get statmodTopic.
   */
  function getStatmodTopic(bytes32 entity) internal view returns (StatmodTopic statmodTopic) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return StatmodTopic.wrap(bytes32(_blob));
  }

  /**
   * @notice Get statmodTopic.
   */
  function _getStatmodTopic(bytes32 entity) internal view returns (StatmodTopic statmodTopic) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return StatmodTopic.wrap(bytes32(_blob));
  }

  /**
   * @notice Set statmodTopic.
   */
  function setStatmodTopic(bytes32 entity, StatmodTopic statmodTopic) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(
      _tableId,
      _keyTuple,
      0,
      abi.encodePacked(StatmodTopic.unwrap(statmodTopic)),
      _fieldLayout
    );
  }

  /**
   * @notice Set statmodTopic.
   */
  function _setStatmodTopic(bytes32 entity, StatmodTopic statmodTopic) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked(StatmodTopic.unwrap(statmodTopic)), _fieldLayout);
  }

  /**
   * @notice Get statmodOp.
   */
  function getStatmodOp(bytes32 entity) internal view returns (StatmodOp statmodOp) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return StatmodOp(uint8(bytes1(_blob)));
  }

  /**
   * @notice Get statmodOp.
   */
  function _getStatmodOp(bytes32 entity) internal view returns (StatmodOp statmodOp) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return StatmodOp(uint8(bytes1(_blob)));
  }

  /**
   * @notice Set statmodOp.
   */
  function setStatmodOp(bytes32 entity, StatmodOp statmodOp) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked(uint8(statmodOp)), _fieldLayout);
  }

  /**
   * @notice Set statmodOp.
   */
  function _setStatmodOp(bytes32 entity, StatmodOp statmodOp) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked(uint8(statmodOp)), _fieldLayout);
  }

  /**
   * @notice Get eleStat.
   */
  function getEleStat(bytes32 entity) internal view returns (EleStat eleStat) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return EleStat(uint8(bytes1(_blob)));
  }

  /**
   * @notice Get eleStat.
   */
  function _getEleStat(bytes32 entity) internal view returns (EleStat eleStat) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return EleStat(uint8(bytes1(_blob)));
  }

  /**
   * @notice Set eleStat.
   */
  function setEleStat(bytes32 entity, EleStat eleStat) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked(uint8(eleStat)), _fieldLayout);
  }

  /**
   * @notice Set eleStat.
   */
  function _setEleStat(bytes32 entity, EleStat eleStat) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked(uint8(eleStat)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(bytes32 entity) internal view returns (StatmodBaseData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(bytes32 entity) internal view returns (StatmodBaseData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(bytes32 entity, StatmodTopic statmodTopic, StatmodOp statmodOp, EleStat eleStat) internal {
    bytes memory _staticData = encodeStatic(statmodTopic, statmodOp, eleStat);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(bytes32 entity, StatmodTopic statmodTopic, StatmodOp statmodOp, EleStat eleStat) internal {
    bytes memory _staticData = encodeStatic(statmodTopic, statmodOp, eleStat);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 entity, StatmodBaseData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.statmodTopic, _table.statmodOp, _table.eleStat);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(bytes32 entity, StatmodBaseData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.statmodTopic, _table.statmodOp, _table.eleStat);

    EncodedLengths _encodedLengths;
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
  ) internal pure returns (StatmodTopic statmodTopic, StatmodOp statmodOp, EleStat eleStat) {
    statmodTopic = StatmodTopic.wrap(Bytes.getBytes32(_blob, 0));

    statmodOp = StatmodOp(uint8(Bytes.getBytes1(_blob, 32)));

    eleStat = EleStat(uint8(Bytes.getBytes1(_blob, 33)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    EncodedLengths,
    bytes memory
  ) internal pure returns (StatmodBaseData memory _table) {
    (_table.statmodTopic, _table.statmodOp, _table.eleStat) = decodeStatic(_staticData);
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
    StatmodTopic statmodTopic,
    StatmodOp statmodOp,
    EleStat eleStat
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(statmodTopic, statmodOp, eleStat);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    StatmodTopic statmodTopic,
    StatmodOp statmodOp,
    EleStat eleStat
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(statmodTopic, statmodOp, eleStat);

    EncodedLengths _encodedLengths;
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
