"use client";

import React, { useState } from 'react'
import Table from '../component/Table';
import axios from 'axios';

export default function page() {

  // everyting is good 
  const [blockNumber, setBlockNumber] = useState(null);
  const [blockData, setBlockData] = useState([]);
  
  const handleSubmit = async (e) => {
    e.preventDefault();
    // sending to backend but check
    // check the limit should be 1-100 or a specific block number


    try {
      const repsonse = await axios.post("/api/info", { block: blockNumber});
      setBlockData(previousData => [...previousData, ... new Set(repsonse.data.data)]);
    } catch (error) { console.log(error)}

  }

  return (
    <div className="text-2xl">
     <div>
      <form onSubmit={handleSubmit} className="w-[50%] mx-auto mt-10">   
          <label htmlFor="search" className="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
          <div className="relative">
              <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                  <svg aria-hidden="true" className="w-5 h-5 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
              </div>
              <input onChange={(e) => setBlockNumber(e.target.value)} type="number" pattern="[0-9]" id="search" className="block w-full p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Search" required />
              <button type="submit" className="text-white absolute right-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Search</button>
          </div>
          </form>
     </div>
     <div className="w-[98%] mx-auto overflow-x-auto relative shadow-md sm:rounded-lg mt-10">
            <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" className="py-3 px-6">
                            Block #
                        </th>
                        <th scope="col" className="py-3 px-6">
                            Block Hash
                        </th>
                        <th scope="col" className="py-3 px-6">
                            TimeStamp
                        </th>
                        <th scope="col" className="py-3 px-6">
                            difficulty
                        </th>
                        <th scope="col" className="py-3 px-6">
                            gasLimit
                        </th>
                        <th scope="col" className="py-3 px-6">
                            gasUsed
                        </th>
                        <th scope="col" className="py-3 px-6">
                            miner
                        </th>
                        <th scope="col" className="py-3 px-6">
                            size
                        </th>
                        <th scope="col" className="py-3 px-6">
                            parentHash
                        </th>
                        <th>
                          Action
                        </th>
                    </tr>
                </thead>
                {
                  blockData.map( item => {
                    return(
                      <tbody className="text-xs">
                        <tr className="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                            <th scope="row" className="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                {item?.blockNumber}
                            </th>
                            <td className="py-4 px-6">
                                {item?.blockHash}
                            </td>
                            <td className="py-4 px-6">
                                {item?.blockTimeStamp}
                            </td>
                            <td className="py-4 px-6">
                                {item?.difficulty}
                            </td>
                            <td className="py-4 px-6">
                                {item?.gasLimit}
                            </td>
                            <td className="py-4 px-6">
                                {item?.gasUsed}
                            </td>
                            <td className="py-4 px-6">
                                {item?.miner}
                            </td>
                            <td className="py-4 px-6">
                                {item?.size}
                            </td>
                            <td className="py-4 px-6">
                                {item?.parentHash}
                            </td>
                            <td className="py-4 px-6">
                                <a href="#" className="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                            </td>
                        </tr>
                      </tbody>
                    )
                  })
                }
            </table>
        </div>
    </div>
  )
}
