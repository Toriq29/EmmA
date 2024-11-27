import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate, useParams } from 'react-router-dom';

const FormEditKaryawan = () => {

    const [namaLengkap, setNamaLengkap] = useState("")
    const [username, setUsername] = useState("")
    const [password, setPassword] = useState("")
    const [confirmPassword, setConfirmPassword] = useState("")
    const [email, setEmail] = useState("")
    const [noTelp, setNoTelp] = useState("")
    const [tglMulaiKerja, setTanggalMulaiKerja] = useState("")
    const [jabatan, setJabatan] = useState("")
    const [golongan, setGolongan] = useState("")
    const [departemen, setDepartemen] = useState("")
    const [statusKaryawan, setStatusKaryawan] = useState("")
    const [msg, setMsg] = useState("")
    const navigate = useNavigate();
    const { id } = useParams()

    useEffect(() => {
        const getKaryawanByKaryawanId = async () => {
            try {
                const response = await axios.get(`http://localhost:5000/karyawan/${id}`)
                setNamaLengkap(response.data.nama_lengkap)
                setUsername(response.data.username)
                setEmail(response.data.email)
                setNoTelp(response.data.no_telp)
                setTanggalMulaiKerja(response.data.tanggal_mulai_kerja)
                setJabatan(response.data.jabatan_id)
                setGolongan(response.data.golongan_id)
                setDepartemen(response.data.golongan_id)
                setStatusKaryawan(response.data.status_karyawan)
            } catch (error) {
                if (error.response) {
                    setMsg(error.response.msg)
                }
            }
        }
        getKaryawanByKaryawanId()
    }, [id])

    const updateKaryawan = async (e) => {
        e.preventDefault();
        try {
            await axios.patch(`http://localhost:5000/karyawan/${id}`, {
                nama_lengkap: namaLengkap,
                username: username,
                password: password,
                confPassword: confirmPassword,
                email: email,
                no_telp: noTelp,
                tanggal_mulai_kerja: tglMulaiKerja,
                jabatan_id: parseInt(jabatan),
                golongan_id: parseInt(golongan),
                departemen_id: parseInt(departemen),
                status_karyawan: statusKaryawan
            })
            navigate("/karyawan")
        } catch (error) {
            if (error.response) {
                setMsg(error.response.data.msg)
            }
        }

    }
    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Karyawan</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Edit Data Karyawan</h2>
            <div className="card is-shadowless">
                <div className="card-content">
                    <div className="content">
                        <form onSubmit={updateKaryawan}>
                            <p className='has-text-centered'>{msg}</p>
                            <div className="field">
                                <label className="label">Nama Lengkap</label>
                                <div className="control">
                                    <input type="text" className="input" value={namaLengkap} onChange={(e) => setNamaLengkap(e.target.value)} placeholder='Nama' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Username</label>
                                <div className="control">
                                    <input type="text" className="input" value={username} onChange={(e) => setUsername(e.target.value)} placeholder='Username' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Password</label>
                                <div className="control">
                                    <input type="password" className="input" value={password} onChange={(e) => setPassword(e.target.value)} placeholder='******' />
                                </div>
                            </div><div className="field">
                                <label className="label">Confirm Password</label>
                                <div className="control">
                                    <input type="password" className="input" value={confirmPassword} onChange={(e) => setConfirmPassword(e.target.value)} placeholder='******' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Email</label>
                                <div className="control">
                                    <input type="text" className="input" value={email} onChange={(e) => setEmail(e.target.value)} placeholder='Email' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">No Telpon</label>
                                <div className="control">
                                    <input type="text" className="input" value={noTelp} onChange={(e) => setNoTelp(e.target.value)} placeholder='No Telpon' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Tanggal Mulai Kerja</label>
                                <div className="control">
                                    <input type="date" className="input" value={tglMulaiKerja} onChange={(e) => {
                                        const value = e.target.value; // Format default: yyyy-MM-dd
                                        const [year, month, day] = value.split("-"); // Pisahkan berdasarkan "-"
                                        const formattedDate = `${day}/${month}/${year}`; // Ubah format menjadi dd/mm/yyyy
                                        setTanggalMulaiKerja(e.target.value); // Simpan dalam state
                                    }} />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Jabatan</label>
                                <div className="control">
                                    <div className="select is-fullwidth">
                                        <select value={jabatan} onChange={(e) => setJabatan(e.target.value)}>
                                            <option value="1">Admin</option>
                                            <option value="2">Karyawan</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Golongan</label>
                                <div className="control">
                                    <div className="select is-fullwidth">
                                        <select value={golongan} onChange={(e) => setGolongan(e.target.value)}>
                                            <option value="1">Admin</option>
                                            <option value="2">Grade 1</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Departemen</label>
                                <div className="control">
                                    <div className="select is-fullwidth">
                                        <select value={departemen} onChange={(e) => setDepartemen(e.target.value)}>
                                            <option value="1">Admin</option>
                                            <option value="2">Cyber Security</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Status Karyawan</label>
                                <div className="control">
                                    <div className="select is-fullwidth">
                                        <select value={statusKaryawan} onChange={(e) => setStatusKaryawan(e.target.value)}>
                                            <option value="aktif">Aktif</option>
                                            <option value="nonaktif">Non Aktif</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="field">
                                <div className="control">
                                    <button type='submit' className="button is-success">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default FormEditKaryawan