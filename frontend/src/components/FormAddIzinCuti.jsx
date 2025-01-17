import React, {useState} from 'react';
import axios from 'axios';
import {useNavigate } from 'react-router-dom';
import { useSelector } from 'react-redux';

const FormAddIzinCuti = () => {
    const { karyawan } = useSelector((state) => state.auth);
    const [tipe, setTipe] = useState("")
    const [tglMulai, setTanggalMulai] = useState("")
    const [tglSelesai, setTanggalSelesai] = useState("")
    const [alasan, setAlasan] = useState("")
    const [msg, setMsg] = useState("")
    const navigate = useNavigate();

    const CreateIzinCuti = async (e) => {
        e.preventDefault();
        try {
            await axios.post(`http://localhost:5000/izincuti/${karyawan.karyawan_id}`, {
                tipe: tipe,
                tanggal_mulai: tglMulai,
                tanggal_selesai: tglSelesai,
                alasan: alasan

            })
            navigate("/izincuti")
        } catch (error) {
            if(error.response){
                setMsg(error.response.data.msg)
            }
        }

    }

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Izin dan Cuti</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Tambah Data Izin atau Cuti</h2>
            <div className="card is-shadowless mr-3">
                <div className="card-content">
                    <div className="content">
                        <form onSubmit={CreateIzinCuti}>
                            <p className='has-text-centered'>{msg}</p>
                            <div className="field">
                                <label className="label">Tipe</label>
                                <div className="control">
                                    <div className="select is-fullwidth">
                                        <select value={tipe} onChange={(e) => setTipe(e.target.value)}>
                                            <option value=""> --- </option>
                                            <option value="izin"> Izin </option>
                                            <option value="cuti"> Cuti </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Tanggal Mulai</label>
                                <div className="control">
                                    <input type="date" className="input" value={tglMulai} onChange={(e) => setTanggalMulai(e.target.value)} />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Tanggal Selesai</label>
                                <div className="control">
                                    <input type="date" className="input" value={tglSelesai} onChange={(e) => setTanggalSelesai(e.target.value)} />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Alasan</label>
                                <div className="control">
                                    <input type="text" className="input" value={alasan} onChange={(e) => setAlasan(e.target.value)} />
                                </div>
                            </div>
                            <div className="field">
                                <div className="control">
                                    <button type='submit' className="button is-success">Kirim Pengajuan</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default FormAddIzinCuti