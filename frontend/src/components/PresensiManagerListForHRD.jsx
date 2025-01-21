import React, { useState, useEffect } from 'react';
import { useSelector } from 'react-redux'
import axios from 'axios';
import { Link } from 'react-router-dom';

const PresensiManagerListForHRD = () => {
    const { karyawan } = useSelector((state) => state.auth)
    const [listManager, setListManager] = useState([]);

    useEffect(() => {
        getManagerByDepartement()
    }, []);

    const getManagerByDepartement = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/managerByDepartement/${karyawan.karyawan_id}`);
            setListManager(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>List Presensi Supervisor</h1>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Lengkap</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    {listManager.map((manager, index) => (
                        <tr key={manager.karyawan_id}>
                            <td>{index + 1}</td>
                            <td>{manager.nama_lengkap}</td>
                            <td>
                                <Link to={`/presensiKaryawan/year/${manager.karyawan_id}`} className='button is-small is-info'>Melihat Tahun Presensi</Link>

                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default PresensiManagerListForHRD;
