import Head from 'next/head'
import Image from 'next/image'
import AddUser from '../components/AddUser'
import Navigation from '../components/Navigation'
import { ContractProvider } from '../context/context'
import styles from '../styles/Home.module.css'

export default function Home() {
  return (
    <div className={styles.container}>
      <Head>
        <title>Create Next App</title>
        <meta name="description" content="Generated by create next app" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <ContractProvider>
        <Navigation />
        <AddUser />
      </ContractProvider>
    </div>
  )
}