pragma solidity ^0.8.17;
/*
任何人都可以发送金额到合约
只有 owner 可以取款
3 种取钱方式
*/
contract EtherWallet {
    address  payable public immutable owner;
    event Log(string funName, address from, uint256 value, bytes data);
    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable { 
        emit Log("receviee", msg.sender, msg.value, "");
    }

    function withdraw1() external {
        require(msg.sender == owner, "Not Owner");
        payable(msg.sender).transfer(100);
    }


    function withdraw2() external {
        require(msg.sender == owner, "Not is Owner");
        bool success = payable(msg.sender).send(200);
        require(success, "Send faile");
    }

    function withdraw3() external {
        require(msg.sender == owner, "Not a Owner");
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Call Failed");
    }

    function getBalance() external view returns (uint256){
        return address(this).balance;
    }


}