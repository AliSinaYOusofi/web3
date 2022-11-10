contract DiffArrays {

    uint [] public addresses; // dynamic sized array
    uint [] public amounts = [3 ether, 4 ether, 1 ether, 1 ether];// dynamics sized array;

    // fixed sized arrays below
    uint [] public minAmounts = [1 wei, 2 wei, 3 wei];

    function getGivenIndex(uint _index) public view returns(uint) {
        return minAmounts[_index];
    }

    function addAtEnd(uint _value) public {
        minAmounts.push(_value);
    }

    function getArray() public view returns(uint[] memory) {
        return minAmounts;
    }

    function pop() public {
        minAmounts.pop();
    }

    function removeGivenIndex (uint _index) public {
        delete minAmounts[_index];
    }

}