const Web3 = require("web3");

const web3 = new Web3("https://celo-mainnet.infura.io/v3/284c8a579bef4db28153c33f9656010e");

const address = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266";
const omise = "0xd26114cd6EE289AccF82350c8d8487fedB8A0C07";
web3.eth.getBalance(address, (error, amountInWei) => {
    if(error) console.log(error);
    balance = web3.utils.fromWei(String(amountInWei), "ether");
    console.log(balance);
});

