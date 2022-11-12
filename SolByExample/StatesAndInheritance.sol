// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;

contract A {
   
    string public  addr;

    constructor(string memory _addr) {
        addr = _addr;
    }
    function one() public pure virtual returns(string memory) {
        return "A";
    }
}

// if the parent contract has a constructor
// is should be called in the child contract during inherting.
contract B is A("hi A") {
   
    constructor(string memory _addr) {
        addr = _addr;
    }
    function one() public pure virtual override returns(string memory) {
        return "B";
    }
}

