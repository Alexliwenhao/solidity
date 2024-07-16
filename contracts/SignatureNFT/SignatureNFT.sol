// SPDX-License-Identifier: MIT 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";

pragma solidity ^0.8.25;

contract SignatureNFT is ERC721 {
    address immutable public signer; //签名地址
    mapping(address => bool) public mintedAddress; // 记录已经mint的地址

    // 构造函数，初始化NFT合集的名称、代号、签名地址
    constructor(string memory _name, string memory _symbol, address _signer) 
    ERC721(_name, _symbol)
    {
        signer = _signer;
    }

    // 利用ECDSA验证签名并mint
    function mint(address _account, uint256 _tokenId, bytes memory _signature) external {
        bytes32 _msgHash = getMessageHash(_account, _tokenId); // 将_account和_tokenId打包消息
        bytes32 _ethSignedMessageHash = MessageHashUtils.toEthSignedMessageHash(_msgHash);
        require(verify(_ethSignedMessageHash, _signature), "Invalid signature");
        require(!mintedAddress[_account], "Already minted!");
        _mint(_account, _tokenId);
        mintedAddress[_account] = true;
    } 

    function getMessageHash(address _account, uint256 _tokenId) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_account, _tokenId));
    }

    // ECDSA验证，调用ECDSA库的verify()函数
    function verify(bytes32 _msgHash, bytes memory _signature) public view returns (bool) {
        address recover = ECDSA.recover(_msgHash, _signature);
        return (recover == signer);
    }
}