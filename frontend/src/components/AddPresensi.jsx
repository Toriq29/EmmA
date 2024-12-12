import React, { useRef, useState, useEffect } from 'react';
import axios from 'axios';
import { useSelector } from 'react-redux';
import { Navigate } from 'react-router-dom';

const AddPresensi = () => {
  const { karyawan } = useSelector((state) => state.auth);
  const [photo, setPhoto] = useState("");
  const [msg, setMsg] = useState("")

  useEffect(() => {
    const getPhotoByKaryawanId = async () => {
      try {
        const response = await axios.get(`http://localhost:5000/karyawan/photo/${karyawan.karyawan_id}`)
        setPhoto(response.data.photo)
      } catch (error) {
        if (error.response) {
          setMsg(error.response.msg)
          console.log(msg)
        }
      }
    }
    getPhotoByKaryawanId()
  })



  return (
    <div>
      <h1 className='title' style={{ color: "black" }}>Presensi</h1>

      {/* Menampilkan gambar yang diambil */}
      {photo && (
        <div style={{ marginTop: '20px' }}>
          <img src={photo} alt="Captured" style={{ width: '100%', maxWidth: '500px' }} />
        </div>
      )}
    </div>
  );
}

export default AddPresensi;
