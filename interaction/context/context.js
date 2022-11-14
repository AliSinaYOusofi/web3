import {useState, createContext, useContext} from 'react';


export const appContext = createContext("");

export const ContractProvider = ({children}) => {

    const [address, setAddress] = useState("");
    
    const connectWallet = async () => {

        if (typeof window !== "undefined" && typeof ethereum !== "undefined") {
            
            try {
                await ethereum.request({method: "eth_requestAccounts"});

            } catch (error) {
                console.log(error);
            }
        }
    }

    return <appContext.Provider value={{connectWallet}}>{children}</appContext.Provider> 
}

export const useAppContext = () => useContext(appContext);