// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
contract Caller{
    address public proxy; // 代理合约地址

    constructor(address proxy_){
        proxy = proxy_;
    }

    // 通过代理合约调用initialize()函数
    function initialize() external {
     proxy.call(abi.encodeWithSignature("initialize()"));
    }
    
    function getTotal() external {
        proxy.call(abi.encodeWithSignature("addTotal()"));// returns the sum of all coins in the contract.;
    }
    function addTotal() external {
       proxy.call(abi.encodeWithSignature("addTotal()"));

    }
}