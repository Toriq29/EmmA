import React, {useState} from 'react';
import axios from 'axios';
import {useNavigate } from 'react-router-dom';

const FormAddDepartemen = () => {
    const [namaDepartemen, setNamaDepartemen] = useState("")
    const [msg, setMsg] = useState("")
    const navigate = useNavigate();

    const saveDepartemen = async (e) => {
        e.preventDefault();
        try {
            await axios.post("http://localhost:5000/departemen", {
                nama_departemen: namaDepartemen,
            })
            navigate("/departemen")
        } catch (error) {
            if(error.response){
                setMsg(error.response.data.msg)
            }
        }

    }

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Departemen</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Tambah Data Departemen</h2>
            <div className="card is-shadowless">
                <div className="card-content">
                    <div className="content">
                        <form onSubmit={saveDepartemen}>
                            <p className='has-text-centered'>{msg}</p>
                            <div className="field">
                                <label className="label">Nama Departemen</label>
                                <div className="control">
                                    <input type="text" className="input" value={namaDepartemen} onChange={(e) => setNamaDepartemen(e.target.value)} placeholder='Nama Departemen' />
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

export default FormAddDepartemen