pragma solidity 0.4.12;

contract WorkingWithFunctions {


    // return multiple unamed values
    function returnMultipleUnnamed
        (string memory _name, 
        address _addr) 
        public 
        pure
        returns (
            string,
            address
        ) {
        
        return (_name, _addr);
    }

    // return multiple nammed values
    function returnMultiplNamed(string memory _name, uint _amount) public pure returns(uint amount, string memory name) {
        _name = "one";
        _amount = 400;
        return (amount, name);
    }

    function multiple(uint _amount, bool _sent) public pure returns(uint, bool) {
        return (44, true);
    }
    // functions that return multiple values can destructured
    function destructureFirst() pure public returns(uint, string, address) {
      
       return (i, "two", 0x043453453453453);
    }

    function arrayAsInput(uint [] memory amounts) public returns(uint [] allAmounts) {
        return amounts;
    }

    function testing() public returns(uint, uint, bool) {
        return (2, 4, true);
    }
    function getValue() public {
        uint [] memory myAmmounts = [4 wei, 2 ether];
        // (uint [] allAmounts) = arrayAsInput(myAmmounts);
        // (uint i, uint j, bool sent) = testing(); // destructuring now
    }

    // different ways of calling functions

    function valueCalling(uint amount, address addr) public pure returns(uint, address) {}

    function caller() external pure returns(uint) {
        // calue with key:value pairs
        valueCalling({amount: 333, addr: 0x0234234});
        // calling with the old ways
        return valueCalling(4444, 0x45345345345);
    } 


    // a new way of returning
    // if you have return name values you can omit the
    
    function noReturnValue(uint amount, address addr) public pure returns(uint __amount, address __address) {
        __amount = 4;
        __address = 0x00000000000000; // as in default values
        // in this case we don't need a return statement
    }
}