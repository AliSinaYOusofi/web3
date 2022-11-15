// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AdvancedLottery {
    // dark web3 developer
    // highest value by lotte given
    uint private highestPaidByLotte;
    // the state varaibles
    address  payable[] public lottes;
    address public owner;
    uint private lotteryCount;

    // events to emit for address
    event ownerSet(address, string); // emit this event when owner is set
    event ownerTrue(address, string); // check if owner is true
    event ownerNotNull(address, string); // not zero address

    // events for msg.value
    event amountIsEnough(uint, string);

    // event for lottery user addition
    event lotteryUserAdded(uint, address, string);

    // a mapping to keep track of address to amounts;
    mapping(address => uint) public lotteAmounts;
    
    // the rule of the game should be that
    // the contract keeps an amount of the game for itself
    // and send the remaining amount to the winner with the max money given

    /*
        1: number players should be at least 5.
        2: every player amount put should be greater thatn 0.0001 ether
        3: max amount should be 1 eth
        4: contract keeps 10 percent of every lottery (will decide).
    */

    // in constructore we also check for highest value paid by alotte
    // since iterations are so costly in solidity due to gas prices
    constructor() payable {
        owner = msg.sender;
        lotteryCount = 0;
        highestPaidByLotte = 0;
        emit ownerSet(owner, "ownew is now set"); // as cheap storage
    }

    

    /*
        the follwing are the modifier for cheking.
    */
    modifier isOwner() {
        require(owner == msg.sender, "not the owner");
        emit ownerTrue(owner, "is good to go");
        _;
    }

    modifier validAddress() {
        require(owner != address(0), "invalid address");
        emit ownerNotNull(owner, "owner is not 0x00");
        _;
    }

    // modifier to check the amount before adding them.
    modifier validAmount() {
        require(msg.value >= 1 ether && msg.value <= 10 ether, "ether should be b/w 1-10 ether");
        emit amountIsEnough(msg.value, "it's all good");
        _; // execute the remaining part
    }

    // adding user for the lottery
    function addLottes()  public payable validAddress validAmount returns(bool x) {
        lottes.push(payable(msg.sender));
        lotteAmounts[msg.sender] = msg.value;  // not lotteAmounts[msg.sender] = msg.value
        emit lotteryUserAdded(msg.value, msg.sender, "user was added");
        /*
            in here we can get the max eth provided by a specific account.
            using a function instead
        */
        return true;
    }

    // functions to select highest eth paid by lotter(user);
    // now this function works. replacing owner to msg.sender
    function selectHighestEthSentByUser() public  returns(uint){
        // will use loops instead of ifs
        uint counter;
        for (counter = 0; counter < lottes.length; counter++) {
            if (lotteAmounts[lottes[counter]] > highestPaidByLotte) {
                highestPaidByLotte = lotteAmounts[lottes[counter]];
                continue;
            }
        } // loops are expensive but that's good for starter
        return highestPaidByLotte;
    }

    /* 
        GETTER FUNCTIONS ONLY 
    */
    // getting the amount of money in this contract
    function getContractToalBalance() public view returns(uint) { return address(this).balance; }
    // getting number of lottes
    function getTotalLottes() public view returns(uint) { return lottes.length + 1;}
    // dum
    function getDummy() public view returns(uint) { return lotteAmounts[lottes[0]];}
    function getLottesAddress() public view returns(address payable [] memory)  { return lottes; }

    // now onto other functionalties

    // TODO: secure random number.
    // TODO: check the min and max number of addresses that has joined the ether.
    // TODO: pick the winner and send the ether to his account.
}