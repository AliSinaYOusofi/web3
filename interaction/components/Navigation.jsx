import React from 'react'
import { useAppContext } from '../context/context'
import ConnectButton from './ConnectButton';

export default function Navigation() {
    const {connectWallet} = useAppContext();
    console.log(connectWallet);

    return (
        <div>
            <ConnectButton connectWallet={connectWallet} />
        </div>
    )
}
