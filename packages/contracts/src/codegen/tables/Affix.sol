// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

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
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

// Import user types
import { AffixPartId } from "./../Types.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Affix")));
bytes32 constant AffixTableId = _tableId;

struct AffixData {
  AffixPartId partId;
  bytes32 protoEntity;
  uint32 value;
}

library Affix {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](3);
    _schema[0] = SchemaType.UINT8;
    _schema[1] = SchemaType.BYTES32;
    _schema[2] = SchemaType.UINT32;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](3);
    _fieldNames[0] = "partId";
    _fieldNames[1] = "protoEntity";
    _fieldNames[2] = "value";
    return ("Affix", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get partId */
  function getPartId(bytes32 entity) internal view returns (AffixPartId partId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return AffixPartId(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get partId (using the specified store) */
  function getPartId(IStore _store, bytes32 entity) internal view returns (AffixPartId partId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return AffixPartId(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Set partId */
  function setPartId(bytes32 entity, AffixPartId partId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(partId)));
  }

  /** Set partId (using the specified store) */
  function setPartId(IStore _store, bytes32 entity, AffixPartId partId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(partId)));
  }

  /** Get protoEntity */
  function getProtoEntity(bytes32 entity) internal view returns (bytes32 protoEntity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get protoEntity (using the specified store) */
  function getProtoEntity(IStore _store, bytes32 entity) internal view returns (bytes32 protoEntity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (Bytes.slice32(_blob, 0));
  }

  /** Set protoEntity */
  function setProtoEntity(bytes32 entity, bytes32 protoEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((protoEntity)));
  }

  /** Set protoEntity (using the specified store) */
  function setProtoEntity(IStore _store, bytes32 entity, bytes32 protoEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((protoEntity)));
  }

  /** Get value */
  function getValue(bytes32 entity) internal view returns (uint32 value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Get value (using the specified store) */
  function getValue(IStore _store, bytes32 entity) internal view returns (uint32 value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Set value */
  function setValue(bytes32 entity, uint32 value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((value)));
  }

  /** Set value (using the specified store) */
  function setValue(IStore _store, bytes32 entity, uint32 value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((value)));
  }

  /** Get the full data */
  function get(bytes32 entity) internal view returns (AffixData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 entity) internal view returns (AffixData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 entity, AffixPartId partId, bytes32 protoEntity, uint32 value) internal {
    bytes memory _data = encode(partId, protoEntity, value);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 entity, AffixPartId partId, bytes32 protoEntity, uint32 value) internal {
    bytes memory _data = encode(partId, protoEntity, value);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 entity, AffixData memory _table) internal {
    set(entity, _table.partId, _table.protoEntity, _table.value);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 entity, AffixData memory _table) internal {
    set(_store, entity, _table.partId, _table.protoEntity, _table.value);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (AffixData memory _table) {
    _table.partId = AffixPartId(uint8(Bytes.slice1(_blob, 0)));

    _table.protoEntity = (Bytes.slice32(_blob, 1));

    _table.value = (uint32(Bytes.slice4(_blob, 33)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(AffixPartId partId, bytes32 protoEntity, uint32 value) internal view returns (bytes memory) {
    return abi.encodePacked(partId, protoEntity, value);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 entity) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 entity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 entity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((entity));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
