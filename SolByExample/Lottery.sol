// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Lottery {
    
    address public owner;
    address payable[] public players;
    address [] public winners;
    uint public lotteryId;

    constructor() {
        owner = msg.sender;
        lotteryId = 0;
    }

    modifier validAddress(address  _owner) {
        require(owner == msg.sender);
        _;
    }

    modifier validAmount() {
        require(msg.value >= 0.1 ether, "invalid amount");
        _;
    }

    // if the modifier uses msg.value there must the payable kw in function
    function enterGame() public  payable validAddress(owner) validAmount  {
        players.push(payable(msg.sender)); // since an array we can just push it.

    }

    // get the players
    function getPlayers() public view returns(address payable[] memory) {
        return players;
    }

    // getting the balance of this contract
    function getContractToalBalance() public view returns (uint) {
        return address(this).balance; // balance of this contract address
    }

    function getlotteryId() public view returns(uint) {
        return lotteryId;
    }

    function genRandomNumber() public view returns(uint) {
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    function pickWinner() public {
        require(owner == msg.sender, "not the owner of the contract");
        uint randomIndex = genRandomNumber() % players.length;
        players[randomIndex].transfer(address(this).balance);
        winners.push(players[randomIndex]);
        lotteryId++;
        players = new address payable[](0); // a way reassigning it to zero.
    }

}