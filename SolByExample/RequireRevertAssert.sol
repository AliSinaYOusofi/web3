pragma solidity <=0.8.17;

contract TestingContract {

    uint public constant amountMax = 3 ether;

    // requried: returns the remaining gas and and reverts any change made.
    // and returns a value

    function send(uint _amount) public pure returns (bool isSent) {
        require(_amount < amountMax);
        // sending
        return true;
    }

    function contractSending(uint _amount) public pure returns (bool isSent) {
        if (amountMax > _amount) {
            revert(); // does not evaluate a statement
            // returns remaining gas. reverts the state ot it's original
        }
        return true;
    }

    // the assert: the statement in the assert can't be false
    // does not return remaining gas. and no revert to original state

    function getContract() public pure returns(bool bin) {
        if ( amountMax > 3 ether) {
            assert(amountMax > 3);
        }

        return true;
    }
}