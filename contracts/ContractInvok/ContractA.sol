// 合约A
pragma solidity ^0.8.0;
// 引入合约B的ABI
import "./ContractB.sol";
contract ContractA {
    ContractB public contractB; // 合约B实例
    constructor(address _contractBAddress) {
        contractB = ContractB(_contractBAddress); // 实例化合约B
    }
    // 向合约B设置值
    function setValueInContractB(uint256 _value) public {
        contractB.setValue(_value);
    }
    // 从合约B获取值
    function getValueFromContractB() public view returns (uint256) {
        return contractB.getValue();
    }
}