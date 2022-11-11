pragma version ^0.8.17;

contract Modifiers {

    address public  owner;
    uint public amount;
    // a boolean to check for rentrancy attack
    // can't be called when the function is still executing

    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    // a modifier to check if the owner is the same as sender
    modifier checkOnwer() {
        require(msg.sender == owner, "Not The Owner");
        _;
    }

    // a modifier to check if a given address is valid a one
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not a valid address");
        _; // execute the rest of the function
        // checking if the address is not a zero address
    }


    // using our modifiers in this function
    function setOnwer(address _owner) public validAddress checkOnwer {
        owner = _owner;
    }
    modifier noRentrancyAttack() {
        require(!locked, "Retrancy Attack!"); // not locked
        locked = true; // set to true
        _; // execute the rest of the function
        locked = false; // set backt o false
    }

    // using the rentrancy modifier

    function sendEthers(uint i) public noRentrancyAttack {
        amount = 10;

        if (i > 1) {
            sendEthers(amount - 1);
        }
    }
}