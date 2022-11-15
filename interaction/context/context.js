import {useState, createContext, useContext} from 'react';
import Web3 from 'web3';
import interactionContract  from '../utils/interactionContract';

export const appContext = createContext({});

export const ContractProvider = ({children}) => {

    const [address, setAddress] = useState();
    const [contract, setContract] = useState();
    const [web3, setWeb3] = useState();
    const [users, setUsers] = useState([]);
    const [balance, setBalance] = useState(0);
   
    
    const connectWallet = async () => {

        if (typeof window !== "undefined" && typeof ethereum !== "undefined") {
            
            try {
                ethereum.request( { method:"eth_requestAccounts" } );
                
                const web3 = new Web3(window.ethereum);
                setWeb3(web3);
                
                const accounts = await web3.eth.getAccounts();
                setAddress(accounts[0]);

                setContract(interactionContract(web3)); // gives the insta to contract 

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
    }

    // the addUsers() function defined in the smart contract.
    const addUser = async () => {
        try {
            await contract.methods.addUsers().send({
                from: address,
                gas: 3000000,
                gasPrice: null
            })
        } catch (error) {
            console.log(error);
        }
    }

    // another function for getting the functions that sended eth to the contract.
    const getUsers = async () => {
        
        try {
            // the method name is getCurrentUsers() in our smart contract.
            const users = await contract.methods.getCurrentUsers().call();
            setUsers(users);
        } catch (error) {
            console.log(error);
        }

    }

    const currentContractBalance = async () => {
        try {
            const balance = await contract.methods.getCurrentContractBalance().call();
            setBalance(balance);
        } catch (error) {
            console.log(error);
        }
    }
    return <appContext.Provider value={{
                connectWallet, 
                address, 
                addUser,
                getUsers,
                balance
            }}
                >{children}
                </appContext.Provider> 
}

export const useAppContext = () => {
    return useContext(appContext)
}