// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/utils/introspection/IERC165.sol";

contract ERC165Demo is IERC165 {
    /*
     * bytes4(keccak256('supportsInterface(bytes4)')) == 0x01ffc9a7
     */
    bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor() public {
        _registerInterface(_INTERFACE_ID_ERC165);
        _registerInterface(this.test.selector); // 注册合约对外接口
    }

    function supportsInterface(bytes4 interfaceId) external view returns(bool) {
        return _supportedInterfaces[interfaceId];
    }

    function _registerInterface(bytes4 interfaceId) internal {
        require(interfaceId != 0xffffffff, "ERC165: invalid interfaceid");
        _supportedInterfaces[interfaceId] = true;
    }

    function test() external returns (bool) {}
}
