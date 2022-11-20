import { useState } from "react";
import {ethers} from 'ethers';
import Web3Modal from 'web3modal';
import WalletConnectProvider from '@walletconnect/web3-provider';
import { AccountContext } from "../utils/context";
import {ownerAddress} from "../config";
import { css } from "@emotion/css";

import "../styles/globals.css";
import Link from "next/link";

export default function App({Component, pageProps}) {
  const [account, setAccount] = useState();

  async function getWeb3Modal() {
    
    const modal = new Web3Modal({
      cacheProvider: false,
      providerOptions: {
        walletConnect: {
          package: WalletConnectProvider,
          options: {
            infuraId: "ac60bf08eab34456b35d2feeee45f0b4"
          }
        }
      }
    });

    return modal;
  }

  // setting the current account logged in
  async function connect() {
    try {
      const web3modal = await getWeb3Modal();
      const connection = await web3modal.connect();
      const provider = new ethers.providers.Web3Provider(connection);
      const accounts = await provider.listAccounts();
      setAccount(account[0]);
    } catch (error) { console.log(error)}
  }

  return (
    <div>
      <nav>
        <div className="header">
          <Link href="/">
            svg Link
          </Link>
          <Link href="/">
            <span> Web3Blog </span>
          </Link>
          {
            !account && ( <div className="not logged in"> <button onClick={connect}>Connect Wallet</button> </div>)
          }
          {
            account && <p>{account}</p>
          }
        </div>

        <div className="tow buttons">
            <Link href="/">
              Home
            </Link>

            {
              (account === ownerAddress) 
                &&
                (
                  <Link href="/create_post">
                    Create Post
                  </Link>
                )
            }
        </div>
      </nav>
      {/* the other parts that is also with a navbar */}
      <div className="container">
        <AccountContext.Provider value={connect}>
          <Component {...pageProps} connect={connect} />
        </AccountContext.Provider>
      </div>
    </div>
  )
}