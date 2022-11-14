import React, {useState} from 'react'
import Web3 from 'web3';

export default function ConnectButton({connectWallet}) {
    
    console.log(connectWallet);

    return (
        
        <nav >
            <div className="container flex flex-wrap justify-between items-center mx-auto">
               
                <div className="flex md:order-2">
                    <button onClick={connectWallet} type="button" className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-3 md:mr-0 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Get started</button>
                    
                </div>
            </div>
        </nav>

    )
}
