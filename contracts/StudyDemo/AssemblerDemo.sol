// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AssemblerDemo {
    function addAssembly(uint x, uint y) public pure returns (uint){
        assembly { 
        let result := add(x, y) // x+y 
        mstore(0x0, result) // 在内存中保存结果 
        return(0x0, 32) // 从内存中返回 32 字节 
        } 
    } 
    function addSolidity(uint x, uint y) public pure returns (uint) {
        return x + y; 
    }
}