// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.8.1/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DeveloperDenToken is ERC20Capped, ERC20Burnable {
    address public payable owner;
    uint public  blockReward;
    constructor(uint256 cap, uint256 reward) ERC20("DeveloperDenToken","DDT") ERC20Capped(cap*(10**decimals())){
        owner = payable(msg.sender);
        blockReward = reward *(10**decimals());
        _mint(owner, 70000*(10**decimals()));
    }

    modifier  onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
    
    function setBlockReward() public onlyOwner {
        blockReward = reward * (10**decimals());
    }

}