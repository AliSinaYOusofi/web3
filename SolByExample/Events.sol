// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;

contract Events {
    // the index keyword allows you to
    // search for specific values
    // instead of searching for all of them.

    event deposited(address indexed sender, uint indexed amount);
    // new we can search for sender and amount parameter

    function depositToUser(address _addr, uint _amount) public  {
        emit deposited(_addr, _amount);
        // now we can get the emitted event.
        // in js and update the ui or use it as a cheap storage.
    }
}

