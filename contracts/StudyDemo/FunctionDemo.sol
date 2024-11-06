// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FucntionDemo {

    function square(uint x) public pure returns (uint) {
        return x * x;
    } 

    function double(uint x) public pure returns(uint) {
        return 2 * x;
    }

    function getSquareSelector() public pure returns (bytes4) {
        return this.square.selector;
    }

    function getDoubleSelector() public pure returns (bytes4) {
        return bytes4(keccak256("double(uint256)"));
    }

    function getDoubleSelecttorV2() public pure returns (bytes4) {
        return this.double.selector;
    }

    function executeFunction(bytes4 selector, uint x) public  returns (uint z) {
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
        require(success, "not success");
        z = abi.decode(data, (uint));
        return z;
    }

    bytes4 public storedSelector;

    
    function executeStoredFunction(uint x) public  returns (uint z) {
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector, x));
        require(success, "not success");
        z = abi.decode(data, (uint));
        return z;
    }

    function setFunction(bytes4 selector) public {
        storedSelector = selector;
    }


}