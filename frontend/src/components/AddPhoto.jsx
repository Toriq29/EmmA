import React, { useRef, useState, useEffect } from 'react';
import axios from 'axios';
import { useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';

const AddPhoto = () => {
  const { karyawan } = useSelector((state) => state.auth);
  const navigate = useNavigate();

  const videoRef = useRef(null); // Untuk referensi video stream
  const canvasRef = useRef(null); // Untuk referensi canvas tempat menangkap foto
  const [isStreaming, setIsStreaming] = useState(false); // Menyimpan status streaming kamera
  const [photo, setPhoto] = useState(""); // Menyimpan gambar yang sudah diambil
  const [msg, setMsg] = useState(""); // Menyimpan pesan error atau status

  const [stream, setStream] = useState(null); // Menyimpan stream kamera untuk mematikan/menyalakan kamera

  // Fungsi untuk mengaktifkan kamera
  const startCamera = () => {
    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
      navigator.mediaDevices.getUserMedia({ video: true })
        .then((userStream) => {
          videoRef.current.srcObject = userStream;
          setStream(userStream); // Simpan stream untuk di-stop nanti
          setIsStreaming(true);
        })
        .catch((error) => {
          console.error("Error accessing camera: ", error);
        });
    } else {
      alert("Your browser does not support camera access.");
    }
  };

  // Fungsi untuk mematikan kamera
  const stopCamera = () => {
    if (stream) {
      const tracks = stream.getTracks();
      tracks.forEach(track => track.stop()); // Menutup semua track video
      setIsStreaming(false);
      setStream(null); // Reset stream
      console.log("Kamera dimatikan");
    }
  };

  // Fungsi untuk menangkap foto dari video
  const capturePhoto = () => {
    const canvas = canvasRef.current;
    const video = videoRef.current;
    const context = canvas.getContext('2d');

    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;

    // Gambar video ke canvas
    context.drawImage(video, 0, 0, canvas.width, canvas.height);

    // Menyimpan gambar dari canvas dalam format Data URL
    const photoDataUrl = canvas.toDataURL('image/jpeg', 0.7);
    setPhoto(photoDataUrl); // Set foto yang diambil ke state
  };

  useEffect(() => {
    // Menyalakan kamera saat komponen pertama kali dimuat
    if (isStreaming && !stream) {
      startCamera();
    }

    // Membersihkan stream saat komponen unmount
    return () => {
      if (stream) {
        const tracks = stream.getTracks();
        tracks.forEach(track => track.stop()); // Menutup semua track video saat komponen unmount
        console.log("Kamera dimatikan saat komponen unmount");
      }
    };
  }, [isStreaming, stream]);

  // Menambahkan foto setelah state photo diperbarui
  useEffect(() => {
    if (photo) {
      addPhoto();
    }
  }, [photo]);

  const addPhoto = async () => {
    try {
      await axios.patch(`http://localhost:5000/karyawan/add_photo/${karyawan.karyawan_id}`, {
        photo: photo,  // Mengirimkan foto sebagai Data URL
      });
      console.log("Photo successfully uploaded");
      setMsg("Foto berhasil disimpan.");
    } catch (error) {
      if (error.response) {
        setMsg(error.response.data.msg);
      }
    }
  };

  return (
    <div style={{ textAlign: 'center', padding: '20px' }}>
      <h1>Simpan Foto Presensi</h1>

      {/* Video Stream */}
      <div style={{ marginBottom: '20px' }}>
        <video
          ref={videoRef}
          autoPlay
          style={{ maxWidth: '100%', height: 'auto' }}
        ></video>
      </div>

      {/* Tombol untuk menyalakan dan mematikan kamera */}
      <div style={{ marginBottom: '20px' }}>
        <button onClick={() => isStreaming ? stopCamera() : startCamera()}>
          {isStreaming ? "Stop Camera" : "Start Camera"}
        </button>
      </div>

      {/* Tombol untuk capture foto */}
      <div style={{ marginBottom: '20px' }}>
        <button onClick={capturePhoto} disabled={!isStreaming}>
          Capture Photo
        </button>
      </div>

      <canvas ref={canvasRef} style={{ display: 'none' }}></canvas> {/* Canvas untuk menangkap foto */}

      {/* Menampilkan status setelah foto disimpan */}
      {msg && (
        <div style={{ marginTop: '20px', color: 'green' }}>
          {msg}
        </div>
      )}
    </div>
  );
};

export default AddPhoto;
