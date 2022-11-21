// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Geon is ERC20 {
    
    address private owner;
    
    constructor (string memory name, string memory symbol, uint256 _initialAmount)  ERC20(name, symbol) {
		_mint(msg.sender, _initialAmount * (1 ether));
		
		owner = msg.sender;
    }
    
    function new_mining(uint256 amount) external {
        require(owner == msg.sender, "Access denied");

        _mint(msg.sender, amount * (1 ether)); 
    }


}