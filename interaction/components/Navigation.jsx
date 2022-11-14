import React from 'react'
import { useAppContext } from '../context/context'
import ConnectButton from './ConnectButton';
import UserCard from './UserCard';


export default function Navigation() {
    
    const {connectWallet, address} = useAppContext();

    return (
        <div className="bg-white flex justify-between px-2 sm:px-4 py-2.5 dark:bg-gray-900 fixed w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600">
             <a href="https://flowbite.com/" className="flex items-center">
                    <img src="https://flowbite.com/docs/images/logo.svg" className="mr-3 h-6 sm:h-9" alt="Flowbite Logo" />
                    <span className="self-center text-xl font-semibold whitespace-nowrap dark:text-white">DAPP</span>
                </a>
            {
                address ? <UserCard address={address} /> : <ConnectButton connectWallet={connectWallet} />
            }
        </div>
    )
}
