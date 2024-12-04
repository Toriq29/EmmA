import React, {useState} from 'react';
import axios from 'axios';
import {useNavigate } from 'react-router-dom';

const FormAddJabatan = () => {
    const [namaJabatan, setNamaJabatan] = useState("")
    const [msg, setMsg] = useState("")
    const navigate = useNavigate();

    const saveJabatan = async (e) => {
        e.preventDefault();
        try {
            await axios.post("http://localhost:5000/jabatan", {
                nama_jabatan: namaJabatan,
            })
            navigate("/jabatan")
        } catch (error) {
            if(error.response){
                setMsg(error.response.data.msg)
            }
        }

    }

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Jabatan</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Tambah Data Jabatan</h2>
            <div className="card is-shadowless">
                <div className="card-content">
                    <div className="content">
                        <form onSubmit={saveJabatan}>
                            <p className='has-text-centered'>{msg}</p>
                            <div className="field">
                                <label className="label">Nama Jabatan</label>
                                <div className="control">
                                    <input type="text" className="input" value={namaJabatan} onChange={(e) => setNamaJabatan(e.target.value)} placeholder='Nama Jabatan' />
                                </div>
                            </div>
                            <div className="field">
                                <div className="control">
                                    <button type='submit' className="button is-success">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default FormAddJabatan