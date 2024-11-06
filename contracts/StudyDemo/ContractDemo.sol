// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract ContractDemo {

   function isContract(address addr) internal view returns (bool) {
    uint256 size;
    assembly {size := extcodesize(addr)}
    return size > 0;
   }
}