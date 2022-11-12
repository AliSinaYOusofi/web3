// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;


contract ZeroOneBase {

    // visibilty
    // state variables can't be external but they can be public private and internal

    // for functions
    // public: by any contract or account.
    // private: only inside the contract.
    // internal: inside the contract and the one inheriting.
    // external: only outside the contract and by any account.

    string  internal  outsideAndInside;
    // will be overriden by child contract
    constructor ( string memory where) {
        outsideAndInside = where;
    }
    function hello() public virtual pure returns(bool x) {
        return true;
    }

    // can only be called inside this contract
    function onlyInsideContract() private pure returns(bool y) {
        return true;
    }

    function privateWorks() public pure returns(bool x) {
        return onlyInsideContract();
    }

    // can only be called inside this and the inherting contract.
    function insideAndInherting() internal virtual pure returns(string memory details) {
        return "only inside this and inherting contract";
    }

    // can only be called outside the contract and accounts.

    function outisderFunc() external pure returns(string memory) {
        return "web3 is fun as well";
    }
}

// now inherting and seeing if it really is what it says

contract ZeroTwoQita is ZeroOneBase("hello zeroOneBase") {
    
    constructor(string memory _name) {
        _name = "hello zeroTwoQita"; // way to override state vars
    }


    // yeah! the internal works just fine.
    function insideAndInherting() internal override pure returns(string memory x) {
        return "hello worldd";
    }
}

// external funcitons should be called outside the functions.