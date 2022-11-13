// SPDX-License-Identifier: GPL-3.0
pragma solidity <=0.8.17;

library NFT {

    // can't set state vars in libs

    function isNFT(address payable _addr) internal view returns(bool x) {
        require(_addr == msg.sender, "invalid sender");
        x;
    }
}

contract mintNFT {
    function checkSent(address payable _addr) public view returns(bool) {
        return NFT.isNFT(_addr); // using that lib like using static methods of a class of java
    }
}