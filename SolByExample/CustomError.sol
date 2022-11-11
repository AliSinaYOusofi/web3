pragma solidity <=0.8.17;

contract CustomErrors {

    error InsufficientBalance(uint balance, uint withDrawAmount); // custom amount

    function runCustomError(uint _withdrawAmount) public view {
        uint balance = address(this).balance;
        revert InsufficientBalance({balance: 3, _withdrawAmount});
    }
}