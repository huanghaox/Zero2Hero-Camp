// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./StorageStructure.sol";
contract ImplementationV2 is StorageStructure {
    modifier initializer() {
        require(!initialized, "Only initialize once");
        _;
        initialized = true;
    }
	modifier onlyOwner() {
		require (msg.sender == owner);
		_;
	}
    function initialize() public initializer {
        owner = msg.sender;
		totalPlayers=0;
    }
	function addPlayer(address _player, uint _points) public onlyOwner   {  
    require (points[_player] == 0);  
    points[_player] = _points;  
    totalPlayers++;  
	}

	function setPoints(address _player, uint _points) public onlyOwner {
		require (points[_player] != 0);
		points[_player] = _points;
		}
	function getTotal()public view returns(uint256){
		return totalPlayers;
	}
	function addTotal()public onlyOwner{
		totalPlayers++;
	}
	
}