import Presensi from "../models/PresensiModel.js";
import Karyawan from "../models/KaryawanModel.js";
import { Op, where } from "sequelize";

export const getPresensi = async(req, res) => {

}

export const getPresensiByKaryawan_id = async(req, res) => {
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            attributes: [
                "karyawan_id", 
                "tanggal", 
                "waktu_masuk", 
                "waktu_keluar", 
            ]
        },{
            where: {
                karyawan_id: karyawan.id
            }
        }
    )
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message})
    }
}

export const createPresensiByKaryawan_id = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        await Presensi.create({
            karyawan_id: karyawan.id,
            tanggal: new Date().toISOString().split('T')[0], // Mengambil tanggal terbaru (format: YYYY-MM-DD)
            waktu_masuk: new Date().toTimeString().split(' ')[0]

        });
        res.status(201).json({ msg: "Presensi Berhasil" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }

}

export const updatePresensiByKaryawan_id = async (req, res) => {

    const tanggal = new Date().toISOString().split('T')[0]

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        await Presensi.update({
            waktu_keluar: new Date().toTimeString().split(' ')[0]
        },{
            where: {
                karyawan_id: karyawan.id,
                waktu_keluar: { [Op.is]: null }
            }
        }
    );
        res.status(201).json({ msg: "Presensi Updated"})
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
    
}