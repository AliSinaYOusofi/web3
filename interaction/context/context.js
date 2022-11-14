import {useState, createContext, useContext} from 'react';
import Web3 from 'web3';

export const appContext = createContext({});

export const ContractProvider = ({children}) => {

    const [address, setAddress] = useState();
    const [contract, setContract] = useState();
    const [web3, setWeb3] = useState();
   
    
    const connectWallet = async () => {

        if (typeof window !== "undefined" && typeof ethereum !== "undefined") {
            
            try {
                ethereum.request( { method:"eth_requestAccounts" } );
                
                const web3 = new Web3(window.ethereum);
                setWeb3(web3);
                
                const accounts = await web3.eth.getAccounts();
                setAddress(accounts[0]);

                setContract(web3);

                ethereum.on('accountsChanged', async () => {
                    let account = await web3.eth.getAccounts();
                    setAddress(account[0]); 
                })

            
            } catch (error) {
                console.log(error);
            }
        }
        else {
            alert("not")
        }

        console.log("not working")
    }


    return <appContext.Provider value={{connectWallet, address}}>{children}</appContext.Provider> 
}

export const useAppContext = () => {
    return useContext(appContext)
}