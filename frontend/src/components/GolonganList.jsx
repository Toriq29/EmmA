import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const GolonganList = () => {
    const [listGolongan, setListGolongan] = useState([]);

    useEffect(() => {
        getListGolongan();
    }, []);

    const getListGolongan = async () => {
        try {
            const response = await axios.get("http://localhost:5000/golongan");
            setListGolongan(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const deleteGolongan = async (id) => {
        try {
            await axios.delete(`http://localhost:5000/golongan/${id}`);
            getListGolongan();
        } catch (error) {
            console.error("Failed to delete data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Golongan</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Data Golongan</h2>
            <Link to={`/golongan/add`} className='button is-small is-info'>Tambah Data Golongan</Link>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Golongan</th>
                    </tr>
                </thead>
                <tbody>
                    {listGolongan.map((golongan, index) => (
                        
                        <tr key={golongan.id}>
                            <td>{index + 1}</td>
                            <td>{golongan.nama_golongan}</td>
                            <td>
                                <button 
                                    onClick={() => deleteGolongan(golongan.id)} 
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

export default GolonganList;
