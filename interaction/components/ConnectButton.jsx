import React, {useState} from 'react'
import Web3 from 'web3';

export default function ConnectButton({connectWallet}) {
    
    console.log(connectWallet);

    return (
        <button onClick={connectWallet} className="text-xl mt-10 px-4 bg-blue-400 rounded-md"> click </button>
    )
}
