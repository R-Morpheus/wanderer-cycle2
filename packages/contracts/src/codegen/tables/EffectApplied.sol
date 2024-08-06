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

struct EffectAppliedData {
  bytes32[] entities;
  uint32[] values;
}

library EffectApplied {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "EffectApplied", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x746200000000000000000000000000004566666563744170706c696564000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0000000200000000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (bytes32, bytes32)
  Schema constant _keySchema = Schema.wrap(0x004002005f5f0000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bytes32[], uint32[])
  Schema constant _valueSchema = Schema.wrap(0x00000002c1650000000000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "targetEntity";
    keyNames[1] = "applicationEntity";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "entities";
    fieldNames[1] = "values";
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
   * @notice Get entities.
   */
  function getEntities(
    bytes32 targetEntity,
    bytes32 applicationEntity
  ) internal view returns (bytes32[] memory entities) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get entities.
   */
  function _getEntities(
    bytes32 targetEntity,
    bytes32 applicationEntity
  ) internal view returns (bytes32[] memory entities) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Set entities.
   */
  function setEntities(bytes32 targetEntity, bytes32 applicationEntity, bytes32[] memory entities) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((entities)));
  }

  /**
   * @notice Set entities.
   */
  function _setEntities(bytes32 targetEntity, bytes32 applicationEntity, bytes32[] memory entities) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((entities)));
  }

  /**
   * @notice Get the length of entities.
   */
  function lengthEntities(bytes32 targetEntity, bytes32 applicationEntity) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of entities.
   */
  function _lengthEntities(bytes32 targetEntity, bytes32 applicationEntity) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get an item of entities.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemEntities(
    bytes32 targetEntity,
    bytes32 applicationEntity,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of entities.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemEntities(
    bytes32 targetEntity,
    bytes32 applicationEntity,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Push an element to entities.
   */
  function pushEntities(bytes32 targetEntity, bytes32 applicationEntity, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to entities.
   */
  function _pushEntities(bytes32 targetEntity, bytes32 applicationEntity, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from entities.
   */
  function popEntities(bytes32 targetEntity, bytes32 applicationEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from entities.
   */
  function _popEntities(bytes32 targetEntity, bytes32 applicationEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Update an element of entities at `_index`.
   */
  function updateEntities(bytes32 targetEntity, bytes32 applicationEntity, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of entities at `_index`.
   */
  function _updateEntities(bytes32 targetEntity, bytes32 applicationEntity, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get values.
   */
  function getValues(bytes32 targetEntity, bytes32 applicationEntity) internal view returns (uint32[] memory values) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Get values.
   */
  function _getValues(bytes32 targetEntity, bytes32 applicationEntity) internal view returns (uint32[] memory values) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Set values.
   */
  function setValues(bytes32 targetEntity, bytes32 applicationEntity, uint32[] memory values) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, EncodeArray.encode((values)));
  }

  /**
   * @notice Set values.
   */
  function _setValues(bytes32 targetEntity, bytes32 applicationEntity, uint32[] memory values) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, EncodeArray.encode((values)));
  }

  /**
   * @notice Get the length of values.
   */
  function lengthValues(bytes32 targetEntity, bytes32 applicationEntity) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get the length of values.
   */
  function _lengthValues(bytes32 targetEntity, bytes32 applicationEntity) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get an item of values.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemValues(
    bytes32 targetEntity,
    bytes32 applicationEntity,
    uint256 _index
  ) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Get an item of values.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemValues(
    bytes32 targetEntity,
    bytes32 applicationEntity,
    uint256 _index
  ) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Push an element to values.
   */
  function pushValues(bytes32 targetEntity, bytes32 applicationEntity, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to values.
   */
  function _pushValues(bytes32 targetEntity, bytes32 applicationEntity, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from values.
   */
  function popValues(bytes32 targetEntity, bytes32 applicationEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 1, 4);
  }

  /**
   * @notice Pop an element from values.
   */
  function _popValues(bytes32 targetEntity, bytes32 applicationEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 1, 4);
  }

  /**
   * @notice Update an element of values at `_index`.
   */
  function updateValues(bytes32 targetEntity, bytes32 applicationEntity, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of values at `_index`.
   */
  function _updateValues(bytes32 targetEntity, bytes32 applicationEntity, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(
    bytes32 targetEntity,
    bytes32 applicationEntity
  ) internal view returns (EffectAppliedData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

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
  function _get(
    bytes32 targetEntity,
    bytes32 applicationEntity
  ) internal view returns (EffectAppliedData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

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
  function set(
    bytes32 targetEntity,
    bytes32 applicationEntity,
    bytes32[] memory entities,
    uint32[] memory values
  ) internal {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(entities, values);
    bytes memory _dynamicData = encodeDynamic(entities, values);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    bytes32 targetEntity,
    bytes32 applicationEntity,
    bytes32[] memory entities,
    uint32[] memory values
  ) internal {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(entities, values);
    bytes memory _dynamicData = encodeDynamic(entities, values);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 targetEntity, bytes32 applicationEntity, EffectAppliedData memory _table) internal {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(_table.entities, _table.values);
    bytes memory _dynamicData = encodeDynamic(_table.entities, _table.values);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(bytes32 targetEntity, bytes32 applicationEntity, EffectAppliedData memory _table) internal {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(_table.entities, _table.values);
    bytes memory _dynamicData = encodeDynamic(_table.entities, _table.values);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    EncodedLengths _encodedLengths,
    bytes memory _blob
  ) internal pure returns (bytes32[] memory entities, uint32[] memory values) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    entities = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    values = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint32());
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   *
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory,
    EncodedLengths _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (EffectAppliedData memory _table) {
    (_table.entities, _table.values) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(bytes32 targetEntity, bytes32 applicationEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(bytes32 targetEntity, bytes32 applicationEntity) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(
    bytes32[] memory entities,
    uint32[] memory values
  ) internal pure returns (EncodedLengths _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = EncodedLengthsLib.pack(entities.length * 32, values.length * 4);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(bytes32[] memory entities, uint32[] memory values) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((entities)), EncodeArray.encode((values)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    bytes32[] memory entities,
    uint32[] memory values
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(entities, values);
    bytes memory _dynamicData = encodeDynamic(entities, values);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 targetEntity, bytes32 applicationEntity) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = targetEntity;
    _keyTuple[1] = applicationEntity;

    return _keyTuple;
  }
}
