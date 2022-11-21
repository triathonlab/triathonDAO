// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract ShipExpand is Ownable{
    using SafeMath for uint256;
    address public _verifyAddress;
    address public _geon;
    address public _receiver;
    mapping(address => uint256) public userNonce;

    event AddBlood(address contractAddress,uint256 tokenId,uint256 bloodAddNum,uint256 geonNum,uint256 nonce);
    event Upgrade(address contractAddress,uint256 tokenId,uint256 levelAdd,uint256 geonNum,uint256 nonce);

    constructor(address geon, address receiver,address verifyAddress){
        _receiver = receiver;
        _geon = geon;
        _verifyAddress = verifyAddress;
    }

    function changeVerifyAddress(address newVerifyAddress) external onlyOwner(){
        _verifyAddress = newVerifyAddress;
    }

    function addBlood(address contractAddress,uint256 tokenId,uint256 bloodAddNum,uint256 geonNum,uint256 nonce,bytes32 msgHash,uint8 v,bytes32 r,bytes32 s) external {

        require(userNonce[_msgSender()] == nonce,"nonce not match");
        require(ECDSA.toEthSignedMessageHash(abi.encodePacked(keccak256(abi.encodePacked(contractAddress,tokenId,bloodAddNum,geonNum,nonce)))) == msgHash,"hash not match");
        require(ECDSA.recover(msgHash, v,r,s) == _verifyAddress,"verify can not pass");

        bool ok = IERC20(_geon).transferFrom(_msgSender(),_receiver, geonNum * 1 ether);
        require(ok, "transfer geon to receiver failed when addBlood");

        userNonce[_msgSender()] ++;

        emit AddBlood(contractAddress,tokenId,bloodAddNum,geonNum,nonce);
    }

    function upgrade(address contractAddress,uint256 tokenId,uint256 levelAdd,uint256 geonNum,uint256 nonce,bytes32 msgHash,uint8 v,bytes32 r,bytes32 s) external {

        require(userNonce[_msgSender()] == nonce,"nonce not match");
        require(ECDSA.toEthSignedMessageHash(abi.encodePacked(keccak256(abi.encodePacked(contractAddress,tokenId,levelAdd,geonNum,nonce)))) == msgHash,"hash not match");
        require(ECDSA.recover(msgHash, v,r,s) == _verifyAddress,"verify can not pass");

        bool ok = IERC20(_geon).transferFrom(_msgSender(),_receiver, geonNum * 1 ether);
        require(ok, "transfer geon to receiver failed when upgrade");

        userNonce[_msgSender()] ++;

        emit Upgrade(contractAddress,tokenId,levelAdd,geonNum,nonce);
    }
}