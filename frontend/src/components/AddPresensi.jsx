import React from 'react'
import { useSelector } from 'react-redux'

const AddPresensi = () => {
  const {karyawan} = useSelector((state) => state.auth)
  return (
    <div>
        <h1 className='title' style={{color: "black"}}>Presensi</h1>
    </div>
  )
}

export default AddPresensi