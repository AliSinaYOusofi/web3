import React from 'react'
import { useAppContext } from '../context/context'

export default function UsersTable() {
    // showing all data from the contract that paid eth to it.

    const {getUsers, balance} = useAppContext(); // thats it for this component

    // just map the result
    return (
        
        <div className="overflow-x-auto relative mt-10 rounded-md">
            <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" className="py-3 px-6">
                            User Address
                        </th>
                        <th scope="col" className="py-3 px-6">
                            Eth Deposited
                        </th>
                        <th scope="col" className="py-3 px-6">
                            Contract Ether
                        </th> 
                    </tr>
                </thead>
                <tbody>
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                        <th scope="row" className="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            0x76021462e78CE8cf783baB748f2f6eba2B347555
                        </th>
                        <td className="py-4 px-6">
                           1 eth
                        </td>
                        <td className="py-4 px-6">
                            3 eth
                        </td>
                        
                    </tr>
                    <tr className="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                        <th scopeName="row" className="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            0x76021462e78CE8cf783baB748f2f6eba2B347555
                        </th>
                        <td className="py-4 px-6">
                            1 eth
                        </td>
                        <td className="py-4 px-6">
                           3 eth
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </div>

    )
}
