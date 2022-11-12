// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FunctionSelector {
    /*
    "transfer(address,uint256)"
    0xa9059cbb
    "transferFrom(address,address,uint256)"
    0x23b872dd
    */

    // the first four bytes only man
    function getSelector(string calldata func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}
