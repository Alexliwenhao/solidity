// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Owner {
    //结构体
    struct Identity{
        address addr;
        string name;
    }

    // 枚举
    enum State{
        HasOwner,
        NewOwner
    }

    // 事件

    event OwnerSet(address indexed oldOwnerAddr, address indexed newOwnerAddr);
    event OwnerRemoved(address indexed oldOwnerAddr);

    // 函数修饰器
    modifier isOwner() {
        require(msg.sender == owner.addr);
        _;
    }

    // 状态变量
    Identity private owner;
    State private state;

    // 下面的都是函数

    // 构造函数
    constructor (String memory name) {
        owner.addr = msg.sender
        owner.name = name;
        state = State.HasOwner;
        emit OwnerSet(address(0), owner.addr);
    }
    

}