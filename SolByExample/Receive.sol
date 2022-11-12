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