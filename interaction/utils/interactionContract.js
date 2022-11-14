import { contractABI, contractAddress } from "./constant";

export const interactionContract = (web3) => new web3.eht.contract(contractABI, contractAddress);
// return our contract address
// which make it easy to interact with our contract.
// we use it just as js functions call via RPC.