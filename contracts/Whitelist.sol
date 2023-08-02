//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses=_maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public{
        require(!whitelistedAddresses[msg.sender],"Already whitelisted");
        require(numAddressesWhitelisted<maxWhitelistedAddresses,"Max Limit Reached");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted+=1;
    }
}