import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';

const IzinCutiList = () => {
    const [listIzin, setListIzin] = useState([]);
    const [listCuti, setListCuti] = useState([]);
    const { karyawan } = useSelector((state) => state.auth);

    useEffect(() => {
        getIzinByKaryawanId();
        getCutiByKaryawanId();
    }, []);

    const getIzinByKaryawanId = async () => {
        try {
            const response = await axios.get(`http://localhost:5000/izin/${karyawan.karyawan_id}`);
            setListIzin(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getCutiByKaryawanId = async () => {
        try {
            const response = await axios.get(`http://localhost:5000/cuti/${karyawan.karyawan_id}`);
            setListCuti(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Izin Cuti </h1>
            <Link to={``} className='button is-small is-info'>Pengajuan Izin atau Cuti</Link>
            <h1 className='title mt-4' style={{ color: "black" }} >List Izin</h1>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tanggal Mulai</th>
                        <th>Tanggal Selesai</th>
                        <th>Alasan</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    {listIzin.map((izin, index) => (

                        <tr key={izin.id}>
                            <td>{index + 1}</td>
                            <td>{izin.tanggal_mulai}</td>
                            <td>{izin.tanggal_selesai}</td>
                            <td>{izin.alasan}</td>
                            <td>
                                {izin.status === null
                                    ? "Belum Disetujui"
                                    : izin.status === false
                                        ? "Ditolak"
                                        : izin.status === true
                                            ? "Diterima"
                                            : "Status tidak valid"}
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
            <h1 className='title mt-4' style={{ color: "black" }} >List Cuti</h1>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tanggal Mulai</th>
                        <th>Tanggal Selesai</th>
                        <th>Alasan</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    {listCuti.map((cuti, index) => (

                        <tr key={cuti.id}>
                            <td>{index + 1}</td>
                            <td>{cuti.tanggal_mulai}</td>
                            <td>{cuti.tanggal_selesai}</td>
                            <td>{cuti.alasan}</td>
                            <td>
                                {cuti.status === null
                                    ? "Belum Disetujui"
                                    : cuti.status === false
                                        ? "Ditolak"
                                        : cuti.status === true
                                            ? "Diterima"
                                            : "Status tidak valid"}
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default IzinCutiList;
