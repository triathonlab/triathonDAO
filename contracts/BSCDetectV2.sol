// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract BSCDetectV2 is Ownable{
    using SafeMath for uint256;

    address public _geon;
    address public _geonProvider;

    bool _isLock = false;

    address public _verifyAddress;

    mapping(address => mapping(uint256 => address)) public nftOwner;
    mapping(address => uint256) public userNonce;

    event DetectNFT(address contractAddress,address detecter,uint256[] tokenIds,bool isContinue,uint256 blockStamp);
    event ClaimNFT(address contractAddress,address claimer,uint256[] tokenIds,uint256 blockStamp);
    event ClaimToken(address claimer,uint256 amount,uint256 nonce);

    event OwnerClaimBack(address contractAddress,uint256[] tokenIds);
    event OwnerClaimTo(address contractAddress,uint256[] tokenIds,address[] toAddresses);
   
    constructor(address geonAddress, address geonRewarder,address verifyAddress) { 
        _geon = geonAddress;
        _geonProvider = geonRewarder;
        _verifyAddress = verifyAddress;
    }

    function changeVerifyAddress(address newVerifyAddress) external onlyOwner(){
        _verifyAddress = newVerifyAddress;
    }

    function changeLock(bool isLock) external onlyOwner(){
        _isLock = isLock;
    }

    function detectNFT(address contractAddress, uint256[] memory tokenIds,bool isContinue) external {
        require(_isLock == false,"locked already");

        for(uint256 i=0;i<tokenIds.length;i++){
            IERC721(contractAddress).safeTransferFrom(_msgSender(), address(this), tokenIds[i]);
            nftOwner[contractAddress][tokenIds[i]] = _msgSender();
        }
       
        emit DetectNFT(contractAddress,_msgSender(),tokenIds,isContinue,block.timestamp);
    }

    function claimNFT(address contractAddress,address userAddress, uint256[] memory tokenIds,uint256 nonce,bytes32 msgHash,uint8 v,bytes32 r,bytes32 s) external {
        require(_isLock == false,"locked already");

        require(userAddress == _msgSender(),"not the transaction owner");
        require(userNonce[_msgSender()] == nonce,"nonce not match");
        require(ECDSA.toEthSignedMessageHash(abi.encodePacked(keccak256(abi.encodePacked(contractAddress,userAddress,tokenIds,nonce)))) == msgHash,"hash not match");
        require(ECDSA.recover(msgHash, v,r,s) == _verifyAddress,"verify can not pass");

        for(uint256 i=0;i<tokenIds.length;i++){
            IERC721(contractAddress).safeTransferFrom(address(this), nftOwner[contractAddress][tokenIds[i]], tokenIds[i]);
        }

        userNonce[_msgSender()] ++;

        emit ClaimNFT(contractAddress,_msgSender(),tokenIds,block.timestamp);
    }

    function claimToken(address userAddress,uint256 amount,uint256 nonce,bytes32 msgHash,uint8 v,bytes32 r,bytes32 s) external {
        require(_isLock == false,"locked already");

        require(userAddress == _msgSender(),"not the transaction owner");
        require(userNonce[userAddress] == nonce,"nonce not match");
        require(ECDSA.toEthSignedMessageHash(abi.encodePacked(keccak256(abi.encodePacked(userAddress,amount,nonce)))) == msgHash,"hash not match");
        require(ECDSA.recover(msgHash, v,r,s) == _verifyAddress,"verify can not pass");

        bool ok = IERC20(_geon).transferFrom(_geonProvider, _msgSender(), amount * 1 ether);
        require(ok, "transfer geon to staker failed when claimToken");

        userNonce[_msgSender()] ++;

        emit ClaimToken(_msgSender(),amount,nonce);
    }

    function ownerClaimBack(address contractAddress,uint256[] memory tokenIds) external onlyOwner(){
        for(uint256 i=0;i<tokenIds.length;i++){
            IERC721(contractAddress).safeTransferFrom(address(this), nftOwner[contractAddress][tokenIds[i]], tokenIds[i]);
        }
        emit OwnerClaimBack(contractAddress,tokenIds);
    }

    function ownerClaimTo(address contractAddress,uint256[] memory tokenIds,address[] memory toAddresses) external onlyOwner(){
        require(tokenIds.length == toAddresses.length,"not the same length");
        for(uint256 i=0;i<tokenIds.length;i++){
            // IERC721(contractAddress).safeTransferFrom(address(this), toAddresses[i], tokenIds[i]);
            IERC721(contractAddress).safeTransferFrom(address(this), toAddresses[i], tokenIds[i]);
        }

        emit OwnerClaimTo(contractAddress,tokenIds,toAddresses);
    }

    function onERC721Received(address, address, uint256, bytes calldata) external pure returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
