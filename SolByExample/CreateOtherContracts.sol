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

    function send(address payable _addr, uint _amount) public payable isOwner(_addr) returns(bool y) {
        (bool sent,) = _addr.call{value: _amount}(""); // empty: because of fallback
        require(sent, "failed to sent");
        y;
    }
}

contract CreateObject {

    MotorBoats public motors; // in java it is like creating an object and access emthods inside the class
    
    event Status(string  currentSitaution, bool cirtial);
    event owner(bool x);
    event Log(string reason);

    function checkSent(address payable _addr, uint _amount) public {
        bool isSent = motors.send(_addr, _amount);
        require(isSent, "failed to send ethers to account");
    }

    function testing() public { }

    // going try and catch

    modifier validAmount(uint amount) {
        require(amount > 0.1 ether);
        _;
    }

    modifier validAdress(address payable addr) {
        require(addr == msg.sender, "not the owner");
        emit owner(false);
        _;
    }

    function tryAndCatch(address payable _addr, uint amount) public validAdress(_addr) validAmount(amount) {
        MotorBoats metto = new MotorBoats(44);

        try new MotorBoats(4){ // the expression to check
            bool sentStatus = metto.send(_addr, amount);
            require(sentStatus, "failed to send ether");
        }
        catch Error(string memory error) {
            emit Log(error);
        }
    }

}