// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Functions {
    string public tokenName = "Sabhye Token";
    string public tokenAbbr = "ST";

    address owner;

    mapping(address => uint) record;

    constructor(){
        owner = msg.sender;
    }

    function getBalance() external view returns (uint){
        return record[msg.sender];
    }

    function mint(address to, uint amount) external {
        require(msg.sender == owner, "Only the owner can mint tokens");
        record[to] += amount;
    }

    function transferTo(address to, uint amount) external {
        require(record[msg.sender] >= amount, "Insufficient balance in this account");
        record[to] += amount;
        record[msg.sender] -= amount;
    }

    function burn(uint amount) external {
        require(record[msg.sender] >= amount, "Insufficient balance in this account");
        record[msg.sender] -= amount;
    }

    // New function 1: Transfer ownership
    function transferOwnership(address newOwner) external {
        require(msg.sender == owner, "Only the current owner can transfer ownership");
        require(newOwner != address(0), "New owner address cannot be the zero address");
        owner = newOwner;
    }

    // New function 2: Retrieve tokens
    function retrieveTokens(address from, uint amount) external {
        require(msg.sender == owner, "Only the owner can retrieve tokens");
        require(record[from] >= amount, "Insufficient balance in the target account");
        record[from] -= amount;
        record[owner] += amount;
    }
}
