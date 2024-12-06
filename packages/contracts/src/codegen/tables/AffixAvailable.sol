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
import { AffixPartId } from "../common.sol";

library AffixAvailable {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "AffixAvailable", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x746200000000000000000000000000004166666978417661696c61626c650000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0000000100000000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (uint8, bytes32, uint32)
  Schema constant _keySchema = Schema.wrap(0x00250300005f0300000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bytes32[])
  Schema constant _valueSchema = Schema.wrap(0x00000001c1000000000000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](3);
    keyNames[0] = "affixPart";
    keyNames[1] = "affixAvailabilityEntity";
    keyNames[2] = "ilvl";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "affixes";
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
   * @notice Get affixes.
   */
  function getAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl
  ) internal view returns (bytes32[] memory affixes) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get affixes.
   */
  function _getAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl
  ) internal view returns (bytes32[] memory affixes) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get affixes.
   */
  function get(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl
  ) internal view returns (bytes32[] memory affixes) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get affixes.
   */
  function _get(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl
  ) internal view returns (bytes32[] memory affixes) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Set affixes.
   */
  function setAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    bytes32[] memory affixes
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((affixes)));
  }

  /**
   * @notice Set affixes.
   */
  function _setAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    bytes32[] memory affixes
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((affixes)));
  }

  /**
   * @notice Set affixes.
   */
  function set(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl, bytes32[] memory affixes) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((affixes)));
  }

  /**
   * @notice Set affixes.
   */
  function _set(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    bytes32[] memory affixes
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((affixes)));
  }

  /**
   * @notice Get the length of affixes.
   */
  function lengthAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl
  ) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of affixes.
   */
  function _lengthAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl
  ) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of affixes.
   */
  function length(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of affixes.
   */
  function _length(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl
  ) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get an item of affixes.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of affixes.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of affixes.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItem(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of affixes.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItem(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Push an element to affixes.
   */
  function pushAffixes(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to affixes.
   */
  function _pushAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    bytes32 _element
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to affixes.
   */
  function push(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to affixes.
   */
  function _push(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from affixes.
   */
  function popAffixes(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from affixes.
   */
  function _popAffixes(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from affixes.
   */
  function pop(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from affixes.
   */
  function _pop(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Update an element of affixes at `_index`.
   */
  function updateAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    uint256 _index,
    bytes32 _element
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of affixes at `_index`.
   */
  function _updateAffixes(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    uint256 _index,
    bytes32 _element
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of affixes at `_index`.
   */
  function update(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    uint256 _index,
    bytes32 _element
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of affixes at `_index`.
   */
  function _update(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl,
    uint256 _index,
    bytes32 _element
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(AffixPartId affixPart, bytes32 affixAvailabilityEntity, uint32 ilvl) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(bytes32[] memory affixes) internal pure returns (EncodedLengths _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = EncodedLengthsLib.pack(affixes.length * 32);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(bytes32[] memory affixes) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((affixes)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(bytes32[] memory affixes) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(affixes);
    bytes memory _dynamicData = encodeDynamic(affixes);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(
    AffixPartId affixPart,
    bytes32 affixAvailabilityEntity,
    uint32 ilvl
  ) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(uint8(affixPart)));
    _keyTuple[1] = affixAvailabilityEntity;
    _keyTuple[2] = bytes32(uint256(ilvl));

    return _keyTuple;
  }
}
