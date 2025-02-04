import Karyawan from "../models/KaryawanModel.js";
import argon2 from "argon2";
import { Op } from "sequelize";

export const getKaryawan = async (req, res) => {
    try {
        const response = await Karyawan.findAll({
            attributes: [
                "karyawan_id",
                "nama_lengkap",
                "username",
                "email",
                "no_telp",
                "tanggal_mulai_kerja",
                "jabatan_id",
                "golongan_id",
                "departemen_id",
                "status_karyawan"
            ]
        })
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }

}

export const getKaryawanById = async (req, res) => {
    try {
        const response = await Karyawan.findOne({
            attributes: [
                "karyawan_id",
                "nama_lengkap",
                "username",
                "email",
                "no_telp",
                "tanggal_mulai_kerja",
                "jabatan_id",
                "golongan_id",
                "departemen_id",
                "status_karyawan"
            ],
            where: {
                karyawan_id: req.params.id
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const createKaryawan = async (req, res) => {

    const { nama_lengkap,
        username, password,
        confPassword, email,
        no_telp,
        tanggal_mulai_kerja,
        jabatan_id,
        golongan_id,
        departemen_id,
        status_karyawan
    } = req.body;

    if (password != confPassword) return res.status(400).json({ msg: "Password dan Confirm Password tidak cocok" });
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
        res.status(201).json({ msg: "Register Berhasil" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const updateKaryawan = async (req, res) => {
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.id
        }
    });
    if (!karyawan) return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    const { nama_lengkap,
        username, password,
        confPassword, email,
        no_telp,
        tanggal_mulai_kerja,
        jabatan_id,
        golongan_id,
        departemen_id,
        status_karyawan
    } = req.body;

    let hashPassword;
    if (password === "" || password === null) {
        hashPassword = karyawan.password
    } else {
        hashPassword = await argon2.hash(password);
    }
    if (password != confPassword) return res.status(400).json({ msg: "Password dan Confirm Password tidak cocok" });
    try {
        await Karyawan.update({
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
        }, {
            where: {
                id: karyawan.id
            }
        }
        );
        res.status(200).json({ msg: "Karyawan Updated" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const deleteKaryawan = async (req, res) => {
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.id
        }
    });
    if (!karyawan) return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    try {
        await Karyawan.destroy({
            where: {
                id: karyawan.id
            }
        });
        res.status(200).json({ msg: "Karyawan Deleted" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const getKaryawanByDepartement = async (req, res) => {
    try {
        const karyawan = await Karyawan.findOne({
            where: {
                karyawan_id: req.params.id
            }
        });

        if (!karyawan) {
            return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
        }

        const response = await Karyawan.findAll({
            attributes: [
                "karyawan_id",
                "nama_lengkap"
            ],
            where: {
                [Op.and]: [
                    { departemen_id: karyawan.departemen_id },
                    { jabatan_id: 2 }
                ]
            }
        });

        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};

export const getSupervisorByDepartement = async (req, res) => {
    try {
        const karyawan = await Karyawan.findOne({
            where: {
                karyawan_id: req.params.id
            }
        });

        if (!karyawan) {
            return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
        }

        const response = await Karyawan.findAll({
            attributes: [
                "karyawan_id",
                "nama_lengkap"
            ],
            where: {
                [Op.and]: [
                    { departemen_id: karyawan.departemen_id },
                    { jabatan_id: 3 }
                ]
            }
        });

        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};
export const getManagerByDepartement = async (req, res) => {
    try {
        const karyawan = await Karyawan.findOne({
            where: {
                karyawan_id: req.params.id
            }
        });

        if (!karyawan) {
            return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
        }

        const response = await Karyawan.findAll({
            attributes: [
                "karyawan_id",
                "nama_lengkap"
            ],
            where: {
                [Op.and]: [
                    { departemen_id: karyawan.departemen_id },
                    { jabatan_id: 4 }
                ]
            }
        });

        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};

export const addPhoto = async (req, res) => {
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.id
        }
    });
    if (!karyawan) return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    const { photo } = req.body;


    try {
        await Karyawan.update({
            photo: photo
        }, {
            where: {
                id: karyawan.id
            }
        }


        );
        res.status(200).json({ msg: "Photo Dimasukkan" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const getPhotoById = async (req, res) => {
    try {
        const response = await Karyawan.findOne({
            attributes: [
                "photo",
            ],
            where: {
                karyawan_id: req.params.id
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}
