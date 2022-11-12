// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;


contract willNotChangeAddressAndValue {
    uint public value;
    address public addr;
    uint public number;


    function setThoseValue(uint _num) public payable {
        number = _num;
        addr = msg.sender;
        value = msg.value;
    }
}

contract CallContractWillNotChange {

    uint public number;
    uint public value;
    address public sender;

    function setThosVals(uint _num, address _contract) public payable {
        (bool success, bytes memory data) = _contract.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
        require(success, "failed to calll it");
        
        // calling another functition which is inside another contract we use delegateCall.
        // the delegateCall will not change the msg.sender and msg.value
        // and it even does not change not even state varaiables.

        // the called function's state variable can never be read or written
        // but called fucntion can read the caller func state and write to it's state vars.
    }
}

