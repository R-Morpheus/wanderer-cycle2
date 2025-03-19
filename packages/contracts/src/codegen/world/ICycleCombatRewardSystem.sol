// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

/**
 * @title ICycleCombatRewardSystem
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface ICycleCombatRewardSystem {
  function reward(bytes32 wandererEntity, bytes32 requestId) external;

  function cancelRequest(bytes32 wandererEntity, bytes32 requestId) external;
}
