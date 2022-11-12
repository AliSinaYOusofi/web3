// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;

contract ReceiveEhter {

   // if msg.data is not empty => fallback()
   // if msg.data is empty => receive()
   // if not msg.data and no receive then => fallback();

   receive() external payable{}// if msg.data is empty
   fallback() external payable{} // if msg.data is not empty

   function getBalance() public view returns(uint) {
       return address(this).balance;
   }
}

contract SendEther {


    // sending via transfer(2300 wei gass, throws an error)
    function sendViaTranser(address payable _addr) public payable {
        _addr.transfer(msg.value); // in the data of the contract
    }

    // sending via send(2300 wei gas, returns bools)
    function viaSend(address payable _addr) public payable {
        bool isSent = _addr.send(msg.value); // returns a boolean only
        require(isSent, "i don't know failed to send ether");
    }

    // sending via
    function viaCall(address payable _addr) public payable {
        (bool sent,) = _addr.call{value: 2 ether}(""); // empty argument triggers the fallback functions
        require(sent, "failed to send");
    }
}