import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate, useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';

const PresensiYearKaryawanListForSupervisor = () => {
    const { id } = useParams()
    const [listYear, setListYear] = useState([]);
    const [namaLengkap, setNamaLengkap] = useState("")
    const [msg, setMsg] = useState("")

    useEffect(() => {
        const getYearPresensiByKaryawan_id = async () => {
            try {
                const response = await axios.post(`http://localhost:5000/yearPresensi/${id}`);
                setListYear(response.data);
            } catch (error) {
                console.error("Failed to fetch data:", error);
            }
        };
        getYearPresensiByKaryawan_id()
        getKaryawanByKaryawanId()
    }, [id])

    const getKaryawanByKaryawanId = async () => {
        try {
            const response = await axios.get(`http://localhost:5000/karyawan/${id}`)
            setNamaLengkap(response.data.nama_lengkap)
        } catch (error) {
            if (error.response) {
                setMsg(error.response.msg)
            }
        }
    }

    

    return (
        <div>
            <h2 className='subtitle' style={{color: "black"}}> Tahun Presensi  <b>{namaLengkap}</b></h2>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tahun</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    {listYear.map((year, index) => (
                        <tr >
                            <td>{index + 1}</td>
                            <td>{year.tahun}</td>
                            <td>
                                <Link to={`/presensiKaryawan/detail/${id}/${year.tahun}`} className='button is-small is-info'>Melihat Presensi Tahun ini</Link>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

export default PresensiYearKaryawanListForSupervisor