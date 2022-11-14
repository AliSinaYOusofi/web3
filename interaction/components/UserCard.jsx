import React from 'react'
import { truncate } from '../funcs/truncateFunction';

export default function UserCard({address}) {

    return (
        <div>
            <p> welcome {truncate(address)}</p>
        </div>
    )
}
