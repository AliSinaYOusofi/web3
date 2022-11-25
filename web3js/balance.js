const Web3 = require("web3");

const web3 = new Web3("https://celo-mainnet.infura.io/v3/284c8a579bef4db28153c33f9656010e");
// the counter

async function blockInfo() {
    const latestBlock = await web3.eth.getBlockNumber();

    let counter = 0;
    let blockInfoData = [];
    
    for (counter; counter < 10; counter++) {
        
        let currentBlock = await web3.eth.getBlock(latestBlock - counter)

        blockInfoData[counter] = {
            blockNumber : currentBlock.number,
            blockHash : (await currentBlock).hash,
            blockTimeStamp : (await currentBlock).timestamp,
            difficulty: currentBlock.difficulty,
            gasLimit: await currentBlock.gasLimit,
            gasUsed: await currentBlock.gasUsed,
            miner: await currentBlock.miner,
            size: await currentBlock.size,
            parentHash: await currentBlock.parentHash,
        }
    }
    return blockInfoData;
}

blockInfo().then( data => console.log(data)).catch(error => console.log(error));