//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddress;

    // Create a mapping of whitelisted addresses
    // If an address is whitelisted, set its mapping to true
    mapping(address => bool) public whitelistedAddresses;

    // To keep track of total number of whitelisted addresses
    uint8 public numAddressesWhitelisted;

    // Setting the Max num of Whitelisted Addresses
    // User will put this number in at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddress = _maxWhitelistedAddresses;
    }

    // addAddressToWhitelist: this function adds the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        // Checking if the user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );

        // Checking if the maxWhitelistedAddresses has been reached
        require(
            numAddressesWhitelisted < maxWhitelistedAddress,
            "More addresses cant be added, limit reached"
        );

        // Adding the address of the caller to the whitelisted mapping
        whitelistedAddresses[msg.sender] = true;

        // Increasing total of whitelisted Addresses
        numAddressesWhitelisted += 1;
    }
}
