// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// adding library of safeMath for security and checks

library SafeMath {

    // for guarding about integer overflow attack
    function sub(uint256 a, uint256 b) internal pure returns(uint) {
        assert(a >= b);
        return a - b;
    }

    
    function add(uint256 a, uint256 b) internal pure returns(uint) {
        uint c = a + b;
        assert(c >= a); // for ensuring agains integer overflow attack
        return c;
    }
}

contract ERC20 {
    
    // for security reasons
    using SafeMath for uint256;
    
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowed;

    uint256 totalSupply_; // also for the initialICO

    // our events
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokeOwner, address indexed spender, uint tokens);

    constructor(uint256 total) {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_; // assign all of the token to the creator
    }

    // function to return the total supply of the token
    function totalSupply() public view returns(uint256) {
        return totalSupply_;
    }

    // function to return the total balance of the owner
    // provide the address and get the total amount of that account
    function balanceOf(address tokenOwner) public view returns(uint256) {
        return balances[tokenOwner];
    }

    // transferring token to another account
    function transfer(address receiver, uint numTokens) public returns(bool) {
        require(numTokens <= balances[msg.sender]); // should be greater than current balance of it
        balances[msg.sender] = balances[msg.sender].sub(numTokens); // subtract from accounts balance
        balances[receiver] = balances[receiver].add(numTokens); // add that amount to the receiver balance
        emit Transfer(msg.sender, receiver, numTokens); // emit the event
        return true;
    }

    // the following function allows the msg.sender to approve a delegate
    // account like a marketplace to move token from his account to another account.

    function approve(address delegate, uint numTokens) public returns(bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    // the total number of tokens allowed by an owner  to a specific owner
    function allowance(address owner, address delegate) public view returns(uint) {
        return allowed[owner][delegate];
    }

    // allow the delegate account to transfer tokens
    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]); // check if over allocated
        require(numTokens <= allowed[owner][msg.sender]); // check if user allowed that much
        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}