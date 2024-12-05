import React, {useState} from 'react';
import axios from 'axios';
import {useNavigate } from 'react-router-dom';

const FormAddGolongan = () => {
    const [namaGolongan, setNamaGolongan] = useState("")
    const [msg, setMsg] = useState("")
    const navigate = useNavigate();

    const saveGolongan = async (e) => {
        e.preventDefault();
        try {
            await axios.post("http://localhost:5000/golongan", {
                nama_golongan: namaGolongan,
            })
            navigate("/golongan")
        } catch (error) {
            if(error.response){
                setMsg(error.response.data.msg)
            }
        }

    }

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Golongan</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Tambah Data Golongan</h2>
            <div className="card is-shadowless">
                <div className="card-content">
                    <div className="content">
                        <form onSubmit={saveGolongan}>
                            <p className='has-text-centered'>{msg}</p>
                            <div className="field">
                                <label className="label">Nama Golongan</label>
                                <div className="control">
                                    <input type="text" className="input" value={namaGolongan} onChange={(e) => setNamaGolongan(e.target.value)} placeholder='Nama Golongan' />
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

export default FormAddGolongan