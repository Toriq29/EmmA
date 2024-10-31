import Karyawan from "../models/KaryawanModel";
import argon2 from "argon2";

export const Login = async(req, res) => {
    const karyawan = await Karyawan.findOne({
        where: {
            email: req.body.email
        }
    });
    if(!karyawan) return res.status(404).json({msg: "Karyawan tidak ditemukan"});
    const match = argon2.verify(karyawan.password, req.body.password);
    if(!match) return res.status(400).json({msg: "Wrong Password"});
    req.session.karyawan_id = karyawan.karyawan_id
    const karyawan_id = karyawan.karyawan_id;
    const nama_lengkap = karyawan.nama_lengkap;
    const username = karyawan.username;
    const email = karyawan.email;
    const no_telp = karyawan.no_telp;
    const tanggal_mulai_kerja = karyawan.tanggal_mulai_kerja;
    const jabatan_id = karyawan.jabatan_id;
    const golongan_id = karyawan.golongan_id;
    const departemen_id = karyawan.departemen_id;
    const status_karyawan = karyawan.status_karyawan;

    res.status(200).json({
        karyawan_id,
        nama_lengkap,
        username,
        email,
        no_telp,
        tanggal_mulai_kerja,
        jabatan_id,
        golongan_id,
        departemen_id,
        status_karyawan
    })
}

export const Me = async(req, res) => {
    if(!req.session.karyawan_id){
        res.status(401).json({msg: "Mohon login ke akun Anda!"})
    }
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.session.karyawan_id
        }
    });
    if(!karyawan) return res.status(404).json({msg: "Karyawan tidak ditemukan"});
}

export const LogOut = async(req, res) => {
    req.session.destroy((err) => {
        if(err) return res.status(400).json({msg: "Tidak dapat logout"});
        res.status(200).json({msg: "Anda telah logout"})
    })
}