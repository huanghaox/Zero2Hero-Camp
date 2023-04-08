// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract StorageStructure {
	uint public totalPlayers;
	address public implementation;
	address public owner;
	bool public initialized;
	mapping (address => uint) internal points;
}