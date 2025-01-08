import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux'

const ProfilePage = () => {
    const { karyawan } = useSelector((state) => state.auth)


    useEffect(() => {

    }, []);

    return (
        
        <div>
            <h1 className='title' style={{ color: "black" }}>Profile {karyawan.nama_lengkap}</h1>
            <table  style={{ color: "black" }} >
                <tr>
                    <th style={{ color: "black" }}>Nama Lengkap : </th>
                    <td>{karyawan.nama_lengkap}</td>
                </tr>
                <tr>
                    <th style={{ color: "black" }}>Username : </th>
                    <td>{karyawan.username}</td>
                </tr>
                <tr>
                    <th style={{ color: "black" }}>Email : </th>
                    <td>{karyawan.email}</td>
                </tr>
                <tr>
                    <th style={{ color: "black" }}>No. Telepon : </th>
                    <td>{karyawan.no_telp}</td>
                </tr>
                <tr>
                    <th style={{ color: "black" }}>Tanggal Mulai Kerja : </th>
                    <td>{karyawan.tanggal_mulai_kerja}</td>
                </tr>
                <tr>
                    <th style={{ color: "black" }}>Jabatan ID : </th>
                    <td>{karyawan.jabatan_id}</td>
                </tr>
                <tr>
                    <th style={{ color: "black" }}>Golongan ID : </th>
                    <td>{karyawan.golongan_id}</td>
                </tr>
                <tr>
                    <th style={{ color: "black" }}>Departemen ID : </th>
                    <td>{karyawan.departemen_id}</td>
                </tr>
                <tr>
                    <th style={{ color: "black" }}>Status Karyawan : </th>
                    <td>{karyawan.status_karyawan}</td>
                </tr>
            </table>
        </div>
    );
};

export default ProfilePage;
