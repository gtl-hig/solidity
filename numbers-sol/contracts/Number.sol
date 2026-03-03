// SPDX-License-Identifier: GPL-3.0

// pragma solidity >=0.8.20 <0.9.0;

pragma solidity ^0.8.34;

// Our first contract is a simple contract that stores a number.
// We will use this contract to learn about the basics of Solidity.
// We also have examples of modifiers and error handling as well as discussion on pure and view functions. 
contract Number {
    
    address public owner; 
    uint public num = 0;
    error ourError();
    event NumberSet(uint old_value, uint new_value);

    /* contract functions can have modifiers
       which work as pre-condictions for functions
     */
    modifier smallerThan(uint _num) {
        // require (num < _num);
        _;
        require (num < _num, ourError());
    }

    // modifier to check if caller is owner
    modifier isOwner() {
        // If the first argument of 'require' evaluates to 'false', execution terminates and all
        // changes to the state and to Ether balances are reverted.
        // This used to consume all gas in old EVM versions, but not anymore.
        // It is often a good idea to use 'require' to check if functions are called correctly.
        // As a second argument, you can also provide an explanation about what went wrong.
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor () {
        owner = msg.sender;
    }

    // contracts can have pure functions
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // contracts can have getters 
    function getDoubleNumber() public view returns (uint) {
        return num * 2;
    }


    // contracts can have state-modifying functions
    // and to run those functions we need to call a transaction
    function setNumber(uint a) public smallerThan(100) {
        uint old_value = num;
        num = a; // actually the new value is 10
        emit NumberSet(old_value, num);
        // emitting events is cheap
        // it is a good way for off-chain listeners to react to changes in the contract
        // BUT
        // you have no guarantee that the event is legitimate (you need to trust it)
    }
    
    // What we do with errors?
    // fallback() external payable {}

    // Can we receive money?
    // receive() external payable {}

    // Doing all of this when the system continues to run.
    // self-healing
    // self-modifying code
    // self-upgrading code

    
}