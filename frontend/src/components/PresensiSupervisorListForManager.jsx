import React, { useState, useEffect } from 'react';
import { useSelector } from 'react-redux'
import axios from 'axios';
import { Link } from 'react-router-dom';

const PresensiSupervisorListForManager = () => {
    const { karyawan } = useSelector((state) => state.auth)
    const [listSupervisor, setListSupervisor] = useState([]);

    useEffect(() => {
        getSupervisorByDepartement()
    }, []);

    const getSupervisorByDepartement = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/supervisorByDepartement/${karyawan.karyawan_id}`);
            setListSupervisor(response.data);
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
                    {listSupervisor.map((supervisor, index) => (
                        <tr key={supervisor.karyawan_id}>
                            <td>{index + 1}</td>
                            <td>{supervisor.nama_lengkap}</td>
                            <td>
                                <Link to={`/presensiKaryawan/year/${supervisor.karyawan_id}`} className='button is-small is-info'>Melihat Tahun Presensi</Link>

                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default PresensiSupervisorListForManager;
