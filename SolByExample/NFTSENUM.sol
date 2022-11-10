pragma solidity ^0.8.17;

contract Ordering {

    enum TransactionStatus {
        movedToBlockchain,
        waiting,
        sent,
        verified
    }

    address public immutable MY_ADDR;
    
    constructor(address _addr) {
        MY_ADDR = _addr;
    }

    TransactionStatus  currentTransactionStatus = TransactionStatus.movedToBlockchain;

    function moveToBlockchain () public {
        // moving to blockchain somehow
        currentTransactionStatus = TransactionStatus.movedToBlockchain;
    }

    // waiting staus;

    function waiting() public {
        currentTransactionStatus = TransactionStatus.waiting;
    }

    function sent() public {
        currentTransactionStatus = TransactionStatus.sent;
    }

    function verfied () public {
        currentTransactionStatus = TransactionStatus.verified;
    }
}