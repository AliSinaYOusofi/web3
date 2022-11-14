// SPDX-License-Identifier: MIT
pragma solidity <=0.8.17;

contract Interaction {

    address public owner;
    uint public amount;
    address payable [] public users;

    constructor() {
        owner = msg.sender; // owner of the contract;
        amount = 0;
    }

    // get the current number of users
    function getCurrentUsersCount() public view returns(uint) {
        return users.length;
    }

    // a function to add users

    function addUsers() public payable  {
        require(msg.value >= 0.1 ether, "invalid ether amount provided");
        users.push(payable(msg.sender));
    }

    // the balance of this contract
    function getCurrentContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function deleteUsers() public {
        require(msg.sender == owner, "you are not the fucking owner of this contract");
        users = new address payable[](0); // reseting the length
    }

    function getCurrentUser() public view returns(address payable[] memory) {
        return users;
    }
}