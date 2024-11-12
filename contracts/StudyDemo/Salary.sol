// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Salary is ERC20 {
    mapping(address => uint) public tokensForSalaries;
    address public owner = msg.sender;
    mapping(address=>bool) public employees;

    constructor() {}
}