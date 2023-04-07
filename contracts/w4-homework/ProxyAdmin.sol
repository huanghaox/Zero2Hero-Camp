// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
contract StorageStructure {
	address public implementation;
	address public owner;
	mapping (address => uint) internal points;
	uint internal totalPlayers;
}

contract Proxy is StorageStructure {
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function upgradeTo(address _newImplementation) external onlyOwner {
        require(implementation != _newImplementation);
        _setImplementation(_newImplementation);
    }

    fallback() external payable {
        address impl = implementation;
        require(impl != address(0));
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), impl, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(ptr, 0, size)

            switch result
            case 0 {
                revert(ptr, size)
            }
            default {
                return(ptr, size)
            }
        }
    }

    function _setImplementation(address _newImp) internal {
        implementation = _newImp;
    }
}
