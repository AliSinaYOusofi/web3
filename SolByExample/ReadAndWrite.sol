pragma solidity ^0.8.17;

contract StateVarReadWrite {
    // state variable
    uint public constant senderAddress = 44;


    // our setter function for state varaible
    function set(uint _num) public pure {
        _num = senderAddress;
    }
    // getting our state variable using function
    function get() public pure returns(uint){
        return senderAddress;
    }

}