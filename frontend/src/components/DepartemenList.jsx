import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const DepartemenList = () => {
    const [listDepartemen, setListDepartemen] = useState([]);

    useEffect(() => {
        getListDepartemen();
    }, []);

    const getListDepartemen = async () => {
        try {
            const response = await axios.get("http://localhost:5000/departemen");
            setListDepartemen(response.data);
        } catch (error) {
            console.error("Failed to fetch data:", error);
        }
    };

    const deleteDepartemen = async (id) => {
        try {
            await axios.delete(`http://localhost:5000/departemen/${id}`);
            getListDepartemen();
        } catch (error) {
            console.error("Failed to delete data:", error);
        }
    };

    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Departemen</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Data Departemen</h2>
            <Link to={`/departemen/add`} className='button is-small is-info'>Tambah Data Departemen</Link>
            <table className='table is-striped is-fullwidth mt-4'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Departemen</th>
                    </tr>
                </thead>
                <tbody>
                    {listDepartemen.map((departemen, index) => (
                        
                        <tr key={departemen.id}>
                            <td>{index + 1}</td>
                            <td>{departemen.nama_departemen}</td>
                            <td>
                                <Link to={``} className='button is-small is-info'>Edit</Link>
                                <button 
                                    onClick={() => deleteDepartemen(departemen.id)} 
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

export default DepartemenList;
