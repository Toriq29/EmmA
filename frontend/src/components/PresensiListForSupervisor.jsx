import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate, useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';

const PresensiListForSupervisor = () => {
    const { id, year } = useParams()
    const [listPresensiJanuary, setListPresensiJanuary] = useState([]);
    const [listPresensiFebruary, setListPresensiFebruary] = useState([]);
    const [listPresensiMarch, setListPresensiMarch] = useState([]);
    const [listPresensiApril, setListPresensiApril] = useState([]);
    const [listPresensiMay, setListPresensiMay] = useState([]);
    const [listPresensiJune, setListPresensiJune] = useState([]);
    const [listPresensiJuly, setListPresensiJuly] = useState([]);
    const [listPresensiAugust, setListPresensiAugust] = useState([]);
    const [listPresensiSeptember, setListPresensiSeptember] = useState([]);
    const [listPresensiOctober, setListPresensiOctober] = useState([]);
    const [listPresensiNovember, setListPresensiNovember] = useState([]);
    const [listPresensiDecember, setListPresensiDecember] = useState([]);

    useEffect(() => {
        getPresensiJanuaryByKaryawan_idAndYear()
        getPresensiFebruaryByKaryawan_idAndYear()
        getPresensiMarchByKaryawan_idAndYear()
        getPresensiAprilByKaryawan_idAndYear()
        getPresensiMayByKaryawan_idAndYear()
        getPresensiJuneByKaryawan_idAndYear()
        getPresensiJulyByKaryawan_idAndYear()
        getPresensiAugustByKaryawan_idAndYear()
        getPresensiSeptemberByKaryawan_idAndYear()
        getPresensiOctoberByKaryawan_idAndYear()
        getPresensiNovemberByKaryawan_idAndYear()
        getPresensiDecemberByKaryawan_idAndYear()
    }, [id, year])

    const getPresensiJanuaryByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/january/${id}`, {
                tahun: year
            });
            setListPresensiJanuary(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiFebruaryByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/february/${id}`, {
                tahun: year
            });
            setListPresensiFebruary(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiMarchByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/march/${id}`, {
                tahun: year
            });
            setListPresensiMarch(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiAprilByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/april/${id}`, {
                tahun: year
            });
            setListPresensiApril(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiMayByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/may/${id}`, {
                tahun: year
            });
            setListPresensiMay(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiJuneByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/june/${id}`, {
                tahun: year
            });
            setListPresensiJune(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiJulyByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/july/${id}`, {
                tahun: year
            });
            setListPresensiJuly(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiAugustByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/august/${id}`, {
                tahun: year
            });
            setListPresensiAugust(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiSeptemberByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/september/${id}`, {
                tahun: year
            });
            setListPresensiSeptember(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiOctoberByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/october/${id}`, {
                tahun: year
            });
            setListPresensiOctober(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiNovemberByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/november/${id}`, {
                tahun: year
            });
            setListPresensiNovember(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const getPresensiDecemberByKaryawan_idAndYear = async () => {
        try {
            const response = await axios.post(`http://localhost:5000/presensi/december/${id}`, {
                tahun: year
            });
            setListPresensiDecember(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };


    return (
        <div>
            <h2 className='subtitle' style={{ color: "black" }}> Presensi Berdasarkan Bulan </h2>

            <h3 className='subtitle' style={{ color: "black" }}>Januari</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiJanuary.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>Februari</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiFebruary.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>Maret</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiMarch.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>April</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiApril.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>Mei</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiMay.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>Juni</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiJune.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>Juli</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiJuly.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>Agustus</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiAugust.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>September</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiSeptember.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>Oktober</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiOctober.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>November</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiNovember.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3 className='subtitle' style={{ color: "black" }}>Desember</h3>
            <table className='table is-striped is-fullwidth'>
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Bulan</th>
                        <th>Tahun</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>

                    </tr>
                </thead>
                <tbody>
                    {listPresensiDecember.map((presensi, index) => (
                        <tr key={presensi.id}>
                            <td>{presensi.tanggal}</td>
                            <td>{presensi.bulan}</td>
                            <td>{presensi.tahun}</td>
                            <td>{presensi.waktu_masuk}</td>
                            <td>{presensi.waktu_keluar}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

export default PresensiListForSupervisor