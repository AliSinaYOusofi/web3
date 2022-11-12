pragma solidity <=0.8.17;

contract PrimitiveDataTypes {
    // primitive data types in sol are the following
    uint8 public ehterAmount = 10; // 2 ** 8 - 1 bits;
    uint16 public secondWalletAmount = 10000; // 2 ** 16 - 1 bits;
    bool public isSent = false; // booleans 
    // signed itegers
    int public previousAmount = -1; // can have negative values as well as positive
    int public nextAmount = 100000; // positive values;
    address public myAddress; // wallet address;

    // fixed size bytes and dynamic sized bytes which refer to an array

    bytes1  fixedAndDynamic = 0xb5; // => [0111110];

    // default values for all vars are false or zero
    bool public sent; // defaults to false;
    int public amount; // 0
    address public myAmountofAddress; // defautls t0 0x0000000000000
    
    // and thats a wrap for it
}