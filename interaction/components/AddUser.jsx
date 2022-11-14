import React from 'react'
import { useAppContext } from '../context/context'

export default function AddUser() {

    const {addUser} = useAppContext();
    

    return (
        <button onClick={addUser} className="mt-20 text-white bg-blue-700 px-3 py-2 outline-none border-none rounded-md">Join Contract</button>
    )
}
