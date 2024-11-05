// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Car {

    uint  public speed;
    function driver() public virtual {} 
}

contract ElectricCar is Car {

    uint public batteryLevel; 

    function driver() public override {
        super.driver();
        uint i = 0;

    }


}