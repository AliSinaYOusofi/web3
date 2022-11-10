pragma solidity 0.8.14;

contract Immutables {
    // the diff b/w const and immutable is that 
    // imutes are declared immutable 
    // but the values of immutable variables can be set inside
    // the constructor

    // is a convention to use upper case of the matter
    address public immutable ADDRESS;

    constructor (uint _myInt) {
        OLD_ADDRESS = msg.sender;
        // immutable value can be set inside
        // the constructor()
    }
}