import Cuti from "../models/CutiModel.js"
import Karyawan from "../models/KaryawanModel.js";

export const createCuti = async (req, res) => {

    const { 
        tanggal_mulai,
        tanggal_selesai,
        alasan
    } = req.body;

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    if (!karyawan) {
        return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    }


    try {
        await Cuti.create({
            karyawan_id: karyawan.id,
            tanggal_mulai: tanggal_mulai,
            tanggal_selesai: tanggal_selesai,
            alasan: alasan,
        });
        res.status(201).json({ msg: "Pengajuan Izin Berhasil" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const AcceptCuti = async (req, res) => {
    try {
        await Cuti.update({
            status: true,
        }, {
            where: {
                id: req.params.id
            }
        }
        );
        res.status(200).json({ msg: "Pengajuan Cuti Diterima" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const RejectCuti = async (req, res) => {
    try {
        await Cuti.update({
            status: false,
        }, {
            where: {
                id: req.params.id
            }
        }
        );
        res.status(200).json({ msg: "Pengajuan Cuti Ditolak" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}