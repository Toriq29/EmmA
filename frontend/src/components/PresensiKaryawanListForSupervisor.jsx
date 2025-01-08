import React, { useState, useEffect } from 'react';
import { useSelector } from 'react-redux'
import axios from 'axios';
import { Link } from 'react-router-dom';

const PresensiKaryawanListForSupervisor = () => {
    const { karyawan } = useSelector((state) => state.auth)
    const [listKaryawan, setListKaryawan] = useState([]);

    useEffect(() => {
        getKaryawanByDepartement()
    }, []);

    const getKaryawanByDepartement = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/karyawanByDepartement/${karyawan.karyawan_id}`);
            setListKaryawan(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>List Presensi Karyawan</h1>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Lengkap</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    {listKaryawan.map((karyawan, index) => (
                        <tr key={karyawan.karyawan_id}>
                            <td>{index + 1}</td>
                            <td>{karyawan.nama_lengkap}</td>
                            <td>
                                <Link to={`/presensiKaryawan/year/${karyawan.karyawan_id}`} className='button is-small is-info'>Melihat Tahun Presensi</Link>

                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default PresensiKaryawanListForSupervisor;
