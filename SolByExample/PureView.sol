// SPDX-License-Identifier: MIT
pragma solidity <=0.8.17;

contract PuresAndView {

    // pure function: no state will be changed or read; it will not
    // read any data from blockchain nor it will save it.
    // view: state var will be read but not changed;

    // both of the functions above don't cost any gas if called outside a
    // contract but will cost gas if called inside the contract.

    // for info see example below

    uint public stat = 10;

    // it does not even read the state variable
    function add(uint x, uint y) public pure returns (uint) {
        return x + y;
    }

    // the view function just reads the state var
    // it deos not change it 
    function multiply(uint x) public view returns (uint) {
        return stat * x;
    }
}