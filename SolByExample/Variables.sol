pragma solidity ^0.8.17;

contract ThreeVaraiables {
    // there of theme
    // first: state varaibales
    // state variables are permanently stored on the blockchain
    uint public amountToSend = 100; // this is perma stored on the blockcian


    function sendEter () public view {
        // seond: is a local varaiable
        uint i = 33432;
        // this var is stored untill function exits or finishes execution

        // third: gloabl vars: which hold information about the blockchain
        // like the timestamp sender address and receiver and more vars like it;

        address sender = msg.sender; // address of the caller of the function
        uint tiemStamp = block.timestamp; // current block timestamp
    }

    // thats a wrap for it
}