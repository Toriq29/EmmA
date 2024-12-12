import React from 'react'
import { useSelector } from 'react-redux'

const Welcome = () => {
  const {karyawan} = useSelector((state) => state.auth)

  return (
    <div>
        <h1 className='title' style={{color: "black"}}>Dashboard</h1>
        <h2 className='subtitle' style={{color: "black"}}>Welcome Back <b>{karyawan && karyawan.nama_lengkap}</b></h2>
    </div>
  )
}

export default Welcome