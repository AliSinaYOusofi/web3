import React from 'react'
import { useAppContext } from '../context/context'
import ConnectButton from './ConnectButton';
import UserCard from './UserCard';


export default function Navigation() {
    
    const {connectWallet, address} = useAppContext();
    
    return (
        <div>
            {
                address ? <UserCard address={address} /> : <ConnectButton connectWallet={connectWallet} />
            }
        </div>
    )
}
