// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract testAddr {

    function testTransfer(address payable addr) public {
        address myAddr = address(this);
        if (addr.balance < 10 && myAddr.balance >= 10) {
            addr.transfer(10);
        }

    }

}