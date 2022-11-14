import React, {useState} from 'react'
import Web3 from 'web3';

export default function ConnectButton({d}) {
    
    const [web3, setWeb3] = useState();
    const [address, setAddress] = useState();

    const connectWallet = async () => {

        if (typeof window !== "undefined" && typeof ethereum !== "undefined") {
            
            try {
                ethereum.request( { method:"eth_requestAccounts" } );
                
                const web3 = new Web3(window.ethereum);
                setWeb3(web3);
                
                const accounts = await web3.eth.getAccounts();
                setAddress(accounts[0]);
            
            } catch (error) {
                console.log(error);
            }
        }
        else {
            alert("not")
        }

        console.log("not working")
    }

    console.log(address);
    return (
        <button onClick={connectWallet} className="text-xl p-4 bg-blue-400 rounded-lg"> click </button>
    )
}
