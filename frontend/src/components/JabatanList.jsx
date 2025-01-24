import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const JabatanList = () => {
    const [listJabatan, setListJabatan] = useState([]);

    useEffect(() => {
        getListJabatan();
    }, []);

    const getListJabatan = async () => {
        try {
            const response = await axios.get("http://localhost:5000/jabatan");
            setListJabatan(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const deleteJabatan = async (id) => {
        try {
            await axios.delete(`http://localhost:5000/jabatan/${id}`);
            getListJabatan();
        } catch (error) {
            console.error("Failed to delete data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Jabatan</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Data Jabatan</h2>
            <Link to={`/jabatan/add`} className='button is-small is-info'>Tambah Data Jabatan</Link>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Jabatan</th>
                    </tr>
                </thead>
                <tbody>
                    {listJabatan.map((jabatan, index) => (
                        
                        <tr key={jabatan.id}>
                            <td>{index + 1}</td>
                            <td>{jabatan.nama_jabatan}</td>
                            <td>
                                <button 
                                    onClick={() => deleteJabatan(jabatan.id)} 
                                    className='button is-small is-danger ml-2'
                                >
                                    Delete
                                </button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default JabatanList;
