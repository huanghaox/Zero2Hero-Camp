// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract ImplementationV1{
//     uint256 public value;
//     uint256 public constant VERSION = 1;

//     bool public initialized;

//     address public owner;
//     address private logicContract;
    

//     modifier onlyLogicContract() {
//         require(msg.sender == logicContract, "Only logic contract can call");
//         _;
//     }
//     modifier initializer() {
//         require(!initialized, "Only initialize once");
//         _;
//         initialized = true;
//     }

//     function initialize(uint256 _initValue) public initializer {
//         owner = msg.sender;
//         value = _initValue;
//     }

//     function setValue(uint256 _newValue) public {
//         value = _newValue + 10;
//     }
//     function getValue() public view returns(uint256) {
//         return value;
//     }
//     function upgrade(address _newLogic) external onlyLogicContract {
//         logicContract = _newLogic;
//     }
// }
contract StorageStructure {
	address public implementation;
	address public owner;
	mapping (address => uint) internal points;
	uint internal totalPlayers;
}
contract ImplementationV1 is StorageStructure {
	modifier onlyOwner() {
		require (msg.sender == owner);
		_;
	}

	function addPlayer(address _player, uint _points) public onlyOwner {  
    require (points[_player] == 0);  
    points[_player] = _points;  
	}

	function setPoints(address _player, uint _points) public onlyOwner {
		require (points[_player] != 0);
		points[_player] = _points;}
	}

