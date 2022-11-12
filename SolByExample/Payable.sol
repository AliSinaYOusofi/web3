// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;

contract GoodPayable {
    // if payable modifier is not mentioned in a contract.
    // it can not receive or send money. it will be rejected. 

    address payable public owner; // now can send and receive ehter since it uses payable
    // modifier

    modifier isOwner(address _owner) {
        require(_owner == owner, "not the owner");
        _;
    }

    // send ether

    function send() public isOwner(owner) returns(bool sent) {
        
    }

    // fallback function for payable
    function noname() public payable {}

    // making payable an address
    function sendToMe(address payable _addr, uint amount) private returns(bool sent) {
        require(amount < 2 ether, "requries less than 2 ether");
        // now it can send and receive ether
        (bool success, ) = _addr.call{value: amount}("");
        require(success, "failed to send ether");
        return true;
    }

    // a function or variable that is ont payable can't send or receive ether.  
}