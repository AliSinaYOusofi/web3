// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;


contract MotorBoats {

    uint public author;

    constructor(uint _author) {
        author = _author;
    }

    modifier isOwner(address _addr) {
        require(_addr == msg.sender);
        _;
    }
    // deployes the contract.

    function send(address payable _addr, uint _amount) public payable isOwner(_addr) returns(bool y) {
        (bool sent,) = _addr.call{value: _amount}(""); // empty: because of fallback
        require(sent, "failed to sent");
        y;
    }
}

contract CreateObject {

    MotorBoats public motors; // in java it is like creating an object and access emthods inside the class
    
    function checkSent(address payable _addr, uint _amount) public {
        bool isSent = motors.send(_addr, _amount);
        require(isSent, "failed to send ethers to account");
    }
}