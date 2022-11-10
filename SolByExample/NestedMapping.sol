pragma solidity ^0.8.0;

contract NestedMapping {
    // intresting: you can even get a value from nested mapping
    // even if it is not initialized

    mapping(address => mapping(uint => bool)) public haveSufficientAmount;
    uint public minAmountAllowed = 1 ether; // maximum amount should be greater
    // this amount


    // return true if if ammount has sufficient amount
    function accountHasSufficientAmount(address _add, uint _amount) public view returns(bool) {
        return haveSufficientAmount[_add][_amount];
    }

    // before setting check if has enouhg ether
    function setNewAccount( address _addr, uint _amount) public {
        if (_amount > minAmountAllowed) {
            haveSufficientAmount[_addr][_amount] = true;
        } else {
            haveSufficientAmount[_addr][_amount] = false;
        }
    }

    // delete from nested mapping
    function removeFromOnePercent(address _addr, uint _amount) public {
        delete haveSufficientAmount[_addr][_amount];
    }

}