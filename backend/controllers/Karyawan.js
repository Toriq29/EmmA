import Karyawan from "../models/KaryawanModel.js";
import argon2 from "argon2";

export const getKaryawan = async(req, res) => {
    try {
        const response = await Karyawan.findAll()
        res.status(200).json(response);
    } catch (error) {
        res.statu(500).json({msg: error.message})
    }

}

export const getKaryawanById = async(req, res) => {
    try {
        const response = await Karyawan.findOne({
            where: {
                karyawan_id: req.param.id
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.statu(500).json({msg: error.message})
    }
}

export const createKaryawan = async(req, res) => {
    console.log(req.body)
    const {nama_lengkap, username, password, confPassword, email, no_telp, tanggal_mulai_kerja, jabatan_id, golongan_id, departemen_id, status_karyawan} = req.body;
    if(password != confPassword) return res.status(400).json({msg: "Password dan Confirm Password tidak cocok"});
    const hashPassword = await argon2.hash(password);
    try {
        await Karyawan.create({
            nama_lengkap: nama_lengkap,
            username: username,
            password: hashPassword,
            email: email,
            no_telp: no_telp,
            tanggal_mulai_kerja: tanggal_mulai_kerja,
            jabatan_id: jabatan_id,
            golongan_id: golongan_id,
            departemen_id: departemen_id,
            status_karyawan: status_karyawan
        });
        res.status(201).json({msg: "Register Berhasil"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }
}

export const updateKaryawan = (req, res) => {
    
}

export const deleteKaryawan = (req, res) => {
    
}