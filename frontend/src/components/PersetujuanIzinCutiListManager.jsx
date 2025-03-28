import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';

const PersetujuanIzinCutiListManager = () => {
    const [listIzinManager, setListIzinManager] = useState([]);
    const [listCutiManager, setListCutiManager] = useState([]);
    const [listCuti, setListCuti] = useState([]);
    const { karyawan } = useSelector((state) => state.auth);

    useEffect(() => {
        getIzinManagerByDepartement();
        getCutiManagerByDepartement();
    }, []);

    const getIzinManagerByDepartement = async () => {
        try {
            const response = await axios.get(`http://localhost:5000/izinManagerbyDepartemen/${karyawan.karyawan_id}`);
            setListIzinManager(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };
    const getCutiManagerByDepartement = async () => {
        try {
            const response = await axios.get(`http://localhost:5000/cutiManagerbyDepartemen/${karyawan.karyawan_id}`);
            setListCutiManager(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const acceptIzinCuti = async (id) => {
        try {
            await axios.patch(`http://localhost:5000/izincuti/diterima/${id}`);
            getIzinManagerByDepartement();
            getCutiManagerByDepartement();
        } catch (error) {
            console.error("Failed to delete data:", error);
        }
    };

    const rejectIzinCuti = async (id) => {
        try {
            await axios.patch(`http://localhost:5000/izincuti/ditolak/${id}`);
            getIzinManagerByDepartement();
            getCutiManagerByDepartement();
        } catch (error) {
            console.error("Failed to delete data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Persetuan Izin dan Cuti Manager</h1>
            <h1 className='title mt-4' style={{ color: "black" }} >List Izin</h1>
            <table className='table is-striped is-fullwidth mt-4 mr-3'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Lengkap</th>
                        <th>Tanggal Mulai</th>
                        <th>Tanggal Selesai</th>
                        <th>Alasan</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    {listIzinManager.map((izin, index) => (

                        <tr key={izin.id}>
                            <td>{index + 1}</td>
                            <td>{izin.karyawan.nama_lengkap}</td>
                            <td>{izin.tanggal_mulai}</td>
                            <td>{izin.tanggal_selesai}</td>
                            <td>{izin.alasan}</td>
                            <td>
                                {izin.status === null ? (
                                    karyawan.jabatan_id === 5 ? (
                                        <>
                                            <button
                                                onClick={() => acceptIzinCuti(izin.id)}
                                                className="button is-small is-success ml-2"
                                            >
                                                Diterima
                                            </button>
                                            <button
                                                onClick={() => rejectIzinCuti(izin.id)}
                                                className="button is-small is-danger ml-2"
                                            >
                                                Ditolak
                                            </button>
                                        </>
                                    ) : (
                                        "Belum Disetujui"
                                    )
                                ) : izin.status === false ? (
                                    "Ditolak"
                                ) : izin.status === true ? (
                                    "Diterima"
                                ) : (
                                    "Status tidak valid"
                                )}
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h1 className='title mt-4' style={{ color: "black" }} >List Cuti</h1>
            <table className='table is-striped is-fullwidth mt-4 mr-3'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Lengkap</th>
                        <th>Tanggal Mulai</th>
                        <th>Tanggal Selesai</th>
                        <th>Alasan</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    {listCutiManager.map((cuti, index) => (

                        <tr key={cuti.id}>
                            <td>{index + 1}</td>
                            <td>{cuti.karyawan.nama_lengkap}</td>
                            <td>{cuti.tanggal_mulai}</td>
                            <td>{cuti.tanggal_selesai}</td>
                            <td>{cuti.alasan}</td>
                            <td>
                                {cuti.status === null ? (
                                    karyawan.jabatan_id === 5 ? (
                                        <>
                                            <button
                                                onClick={() => acceptIzinCuti(cuti.id)}
                                                className="button is-small is-success ml-2"
                                            >
                                                Diterima
                                            </button>
                                            <button
                                                onClick={() => rejectIzinCuti(cuti.id)}
                                                className="button is-small is-danger ml-2"
                                            >
                                                Ditolak
                                            </button>
                                        </>
                                    ) : (
                                        "Belum Disetujui"
                                    )
                                ) : cuti.status === false ? (
                                    "Ditolak"
                                ) : cuti.status === true ? (
                                    "Diterima"
                                ) : (
                                    "Status tidak valid"
                                )}
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default PersetujuanIzinCutiListManager;
