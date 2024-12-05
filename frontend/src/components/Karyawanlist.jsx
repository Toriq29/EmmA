import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const Karyawanlist = () => {
    const [listKaryawan, setListKaryawan] = useState([]);
    const [jabatan, setJabatan] = useState([]);

    useEffect(() => {
        getListKaryawan();
    }, []);

    const getListKaryawan = async () => {
        try {
            const response = await axios.get("http://localhost:5000/karyawan");
            setListKaryawan(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getJabatanWithJabatanId = async (id) => {
        try {
            const response = await axios.get(`http://localhost:5000/jabatan/${id}`);
            setJabatan(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const deleteKaryawan = async (karyawan_id) => {
        try {
            await axios.delete(`http://localhost:5000/karyawan/${karyawan_id}`);
            getListKaryawan();
        } catch (error) {
            console.error("Failed to delete data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Karyawan</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Data Karyawan</h2>
            <Link to={`/karyawan/add`} className='button is-small is-info'>Tambah Data Karyawan</Link>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Lengkap</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>No Telpon</th>
                        <th>Tanggal Mulai Kerja</th>
                        <th>Jabatan</th>
                        <th>Golongan</th>
                        <th>Departemen</th>
                        <th>Status Karyawan</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    {listKaryawan.map((karyawan, index) => (
                        <tr key={karyawan.karyawan_id}>
                            <td>{index + 1}</td>
                            <td>{karyawan.nama_lengkap}</td>
                            <td>{karyawan.username}</td>
                            <td>{karyawan.email}</td>
                            <td>{karyawan.no_telp}</td>
                            <td>{new Date(karyawan.tanggal_mulai_kerja).toLocaleDateString('en-GB')}</td>
                            <td>{karyawan.jabatan_id}</td>
                            <td>{karyawan.golongan_id}</td>
                            <td>{karyawan.departemen_id}</td>
                            <td>{karyawan.status_karyawan}</td>
                            <td>
                                <Link to={`/karyawan/edit/${karyawan.karyawan_id}`} className='button is-small is-info'>Edit</Link>
                                <button 
                                    onClick={() => deleteKaryawan(karyawan.karyawan_id)} 
                                    className='button is-small is-danger ml-2'
                                >
                                    Delete
                                </button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default Karyawanlist;
