import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';

const PersetujuanIzinCutiListSupervisor = () => {
    const [listIzinSupervisor, setListIzinSupervisor] = useState([]);
    const [listCutiSupervisor, setListCutiSupervisor] = useState([]);
    const [listCuti, setListCuti] = useState([]);
    const { karyawan } = useSelector((state) => state.auth);

    useEffect(() => {
        getIzinSupervisorByDepartement();
        getCutiSupervisorByDepartement();
    }, []);

    const getIzinSupervisorByDepartement = async () => {
        try {
            const response = await axios.get(`http://localhost:5000/izinSupervisorbyDepartemen/${karyawan.karyawan_id}`);
            setListIzinSupervisor(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };
    const getCutiSupervisorByDepartement = async () => {
        try {
            const response = await axios.get(`http://localhost:5000/cutiSupervisorbyDepartemen/${karyawan.karyawan_id}`);
            setListCutiSupervisor(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const acceptIzinCuti = async (id) => {
        try {
            await axios.patch(`http://localhost:5000/izincuti/diterima/${id}`);
            getIzinSupervisorByDepartement();
            getCutiSupervisorByDepartement();
        } catch (error) {
            console.error("Failed to delete data:", error);
        }
    };

    const rejectIzinCuti = async (id) => {
        try {
            await axios.patch(`http://localhost:5000/izincuti/ditolak/${id}`);
            getIzinSupervisorByDepartement();
            getCutiSupervisorByDepartement();
        } catch (error) {
            console.error("Failed to delete data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Persetuan Izin dan Cuti Supervisor</h1>
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
                    {listIzinSupervisor.map((izin, index) => (

                        <tr key={izin.id}>
                            <td>{index + 1}</td>
                            <td>{izin.karyawan.nama_lengkap}</td>
                            <td>{izin.tanggal_mulai}</td>
                            <td>{izin.tanggal_selesai}</td>
                            <td>{izin.alasan}</td>
                            <td>
                                {izin.status === null ? (
                                    karyawan.jabatan_id === 4 ? (
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
                    {listCutiSupervisor.map((cuti, index) => (

                        <tr key={cuti.id}>
                            <td>{index + 1}</td>
                            <td>{cuti.karyawan.nama_lengkap}</td>
                            <td>{cuti.tanggal_mulai}</td>
                            <td>{cuti.tanggal_selesai}</td>
                            <td>{cuti.alasan}</td>
                            <td>
                                {cuti.status === null ? (
                                    karyawan.jabatan_id === 4 ? (
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

export default PersetujuanIzinCutiListSupervisor;
