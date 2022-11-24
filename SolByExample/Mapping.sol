pragma solidity ^0.4.17;

contract MappingNotIterable {

    mapping(address => uint) public balanceInAccount;
    
    // a mapping of each address to the amount of that address

    // return the amount assocaited with an address
    function getAddress(address _addr) public view returns (uint) {
        return balanceInAccount[_addr];
    }

    // set an ammount to an address
    function setAddress(address _address, uint _amount) public {
        balanceInAccount[_address] = _amount;
    }

    // delete an address from a mapping
    function deleteAddressFromMapping (address _addr) public {
        delete balanceInAccount[_addr];
    }
}

