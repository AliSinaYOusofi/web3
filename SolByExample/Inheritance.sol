// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;

contract A {
    // the function that will be overriden by child should be virtual
    function one() public pure virtual returns(string memory) {
        return "A";
    }
}

contract B is A {
    // the function that is going to override the parent should be override
    // if multiple override(first_contract_name, second_contract, ...);
    function one() public pure virtual override returns(string memory) {
        return "B";
    }
}

contract C is A {
    function one() public pure virtual override returns(string memory) {
        return "C";
    }
}

// the parent is considered from left to right and the most right one is selected
// since solidity supports multiple inheritance

contract D is B, C {
    function one() public pure override(B, C)  returns(string memory) {
        return super.one(); // returns "c". since c is the right most
    }
}

// the right most one who has the funcction one();
// the order of inheriting must the from most-base-like to most-derived like
contract E is A, C {
    // c is the one
    function one() public override(A, C) pure returns(string memory) {
        return super.one();
    }
}

