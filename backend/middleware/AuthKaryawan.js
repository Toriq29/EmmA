import Karyawan from "../models/KaryawanModel.js";

export const verifyKarywan = async (req, res, next) => {
    if(!req.session.karyawan_id){
        return res.status(401).json({msg: "Mohon login ke akun Anda!"})
    }
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.session.karyawan_id
        }
    });
    if(!karyawan) return res.status(404).json({msg: "Karyawan tidak ditemukan"});
    req.id = karyawan.id;
    req.jabatan_id = karyawan.jabatan_id;
    next();
}

export const adminOnly = async (req, res, next) => {
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.session.karyawan_id
        }
    });
    if(!karyawan) return res.status(404).json({msg: "Karyawan tidak ditemukan"});
    if(karyawan.jabatan_id !== 1) return res.status(403).json({msg: "Akses Terlarang"})
    next();
}

