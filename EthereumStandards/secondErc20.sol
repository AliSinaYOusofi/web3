// SPDX-License-Identifier: MTI
pragma solidity ^0.8.17;

library ERC20SafeMath {
    
    function addition(uint256 a, uint256 b) public pure returns(uint256) {
        uint256 result = a + b;
        require(result >= a);
        return result;
    }


    function sub(uint256 a, uint256 b) public pure returns(uint256) {
        assert(a >= b);
        return a - b;
    }
}

contract erc20 {

    mapping (address => uint256) public balances;
    mapping(address => mapping(address => uint256)) allowedAmountsForDelegates;

    using ERC20SafeMath for uint256;
    uint256 totalSupply_;

    string public constant name = "g-coin";
    string public constant symbol = "some symbol";

    event Transfer(address indexed to, address indexed from, uint tokenAmount);
    event Approval(address indexed to, address indexed from, uint tokenAmount);

    constructor(uint256 total) {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;
    }

    function totalSupply(address tokenOwner) public view returns(uint256) {
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokenAmount) public returns(bool) {
        require(tokenAmount <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(tokenAmount);
        balances[to] = balances[to].addition(tokenAmount);
        emit Transfer(to, msg.sender, tokenAmount);
        return true;
    }

    function approve(address delegate, uint numTokens) public returns(bool) {
        allowedAmountsForDelegates[msg.sender][delegate] = numTokens;
        emit Approval(delegate, msg.sender, numTokens);
        return true;
    }

    function howMuchIsDelegateAllowed(address owner, address delegate) public view returns (uint256) {
        return allowedAmountsForDelegates[owner][delegate];
    }

    function transferToDelegate(address owner, address delegate, uint token) public returns(bool) {
        require(token <= balances[owner]);
        require(token <= allowedAmountsForDelegates[owner][delegate]);
        balances[owner] = balances[owner] - token;
        allowedAmountsForDelegates[owner][delegate] = allowedAmountsForDelegates[owner][delegate].sub(token);
        balances[delegate] = balances[delegate].addition(token);
        emit Transfer(msg.sender, delegate, token);
        return true;
    } 
}