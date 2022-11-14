import { contractABI, contractAddress } from "./constant";

const interactionContract = (web3) => new web3.eth.Contract(contractABI, contractAddress);
// return our contract address
// which make it easy to interact with our contract.
// we use it just as js functions call via RPC.

export default interactionContract;