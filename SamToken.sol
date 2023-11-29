// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SamToken {
    // Public variables to store details about the token
    string public TokenName;
    string public TokenAbbr;
    uint public totalSupply;

    // Mapping of addresses to their balances
    mapping(address => uint) public balances;

    // Constructor to initialize the token details
    constructor(string memory _name, string memory _abbrv, uint _supply) {
        TokenName = _name;
        TokenAbbr = _abbrv;
        totalSupply = _supply; // Initially, the total supply is zero
    }

    // Mint function to create new tokens
    function mint(address _to, uint _amount) public {
        totalSupply += _amount; // Increase the total supply
        balances[_to] += _amount; // Increase the balance of the receiver
    }

    // Burn function to destroy tokens
    function burn(address _from, uint _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance to burn"); // Ensure the sender has enough balance
        totalSupply -= _amount; // Decrease the total supply
        balances[_from] -= _amount; // Decrease the balance of the sender
    }
}
