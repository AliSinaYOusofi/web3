// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;

contract constructors {
   
   // when will the constructor execute ?
   // on contract creation

   string public  say_my_name;

   constructor(string memory _name) {
       say_my_name = _name;
   }
}

contract second {
    
    address public addr;

    constructor(address _addr) {
        addr = _addr;
    }
}

// how we call these contracts
// this is how we call it
// the order that contract is called: constructors second CallConstructor
// the order is in the order you inherit.
// here becuase constructors() is the parent of all is executed first the second second
// and finally CallConstructor()
// and we also add comma b/w contracts
contract CallConstructor is constructors("heisenberg"), second(msg.sender) {

}

