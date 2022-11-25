import Web3 from 'web3';

export default async function handler(req, res) {
    // getting the value from the thing
    // TODO1: get value from front-end
    // TODO2: scan the blockchain for all the number.
    // TODO3: send back the result and display it on the front-end.
    
    const web3 = new Web3("https://celo-mainnet.infura.io/v3/284c8a579bef4db28153c33f9656010e");

    const {block} = req.body; // the counter
    
    const latestBlock = await web3.eth.getBlockNumber();

    let counter = 0;
    let blockInfoData = [];

    for (counter; counter < Number(block); counter++) {
        
        let currentBlock = await web3.eth.getBlock(latestBlock - counter)

        blockInfoData[counter] = {
            blockNumber : currentBlock.number,
            blockHash : ( currentBlock).hash,
            blockTimeStamp : ( currentBlock).timestamp,
            difficulty: currentBlock.difficulty,
            gasLimit:  currentBlock.gasLimit,
            gasUsed:  currentBlock.gasUsed,
            miner:  currentBlock.miner,
            size:  currentBlock.size,
            parentHash:  currentBlock.parentHash,
        }
    }

    res.status(200).json({data: blockInfoData})
}