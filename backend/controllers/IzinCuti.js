import IzinCuti from "../models/IzinCutiModel.js"
import Karyawan from "../models/KaryawanModel.js";
import { Op } from "sequelize";

export const createIzinCuti = async (req, res) => {

    const {
        tipe,
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
        await IzinCuti.create({
            karyawan_id: karyawan.id,
            tipe: tipe,
            tanggal_mulai: tanggal_mulai,
            tanggal_selesai: tanggal_selesai,
            alasan: alasan,
        });
        res.status(201).json({ msg: "Pengajuan Izin Berhasil" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

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
        await IzinCuti.create({
            karyawan_id: karyawan.id,
            tipe: "cuti",
            tanggal_mulai: tanggal_mulai,
            tanggal_selesai: tanggal_selesai,
            alasan: alasan,
        });
        res.status(201).json({ msg: "Pengajuan Cuti Berhasil" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const getIzinByKaryawan_Id = async (req, res) => {
    try {
        const karyawan = await Karyawan.findOne({
            where: {
                karyawan_id: req.params.karyawan_id
            }
        });

        if (!karyawan) {
            return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
        }

        const response = await IzinCuti.findAll({
            attributes: [
                "tanggal_mulai",
                "tanggal_selesai",
                "alasan",
                "status"
            ],
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tipe: "izin" }
                ]
            }
        });

        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

export const getCutiByKaryawan_Id = async (req, res) => {
    try {
        const karyawan = await Karyawan.findOne({
            where: {
                karyawan_id: req.params.karyawan_id
            }
        });

        if (!karyawan) {
            return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
        }

        const response = await IzinCuti.findAll({
            attributes: [
                "tanggal_mulai",
                "tanggal_selesai",
                "alasan",
                "status"
            ],
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tipe: "cuti" }
                ]
            }
        });

        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

export const AcceptIzinCuti = async (req, res) => {
    try {
        await IzinCuti.update({
            status: true,
        }, {
            where: {
                id: req.params.id
            }
        }
        );
        res.status(200).json({ msg: "Pengajuan Izin/Cuti Diterima" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const RejectIzinCuti = async (req, res) => {
    try {
        await IzinCuti.update({
            status: false,
        }, {
            where: {
                id: req.params.id
            }
        }
        );
        res.status(200).json({ msg: "Pengajuan Izin/Cuti Ditolak" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const getIzinKaryawanByDepartement = async (req, res) => {
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    if (!karyawan) {
        return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    }

    try {
        const response = await IzinCuti.findAll({
            attributes: [
                "id",
                "tipe",
                "tanggal_mulai",
                "tanggal_selesai",
                "alasan",
                "status",
            ],
            where: {
                tipe: "izin",
            },
            include: [
                {
                    model: Karyawan,
                    required: true,
                    attributes: ["nama_lengkap"],
                    where: {
                        departemen_id: karyawan.departemen_id,
                        jabatan_id: 2, // Menambahkan filter jabatan_id di sini
                    },
                },
            ],
            order: [["id", "DESC"]], // Menambahkan pengurutan descending
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(400).json({ msg: error.message });
    }
};

export const getCutiKaryawanByDepartement = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    if (!karyawan) {
        return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    }

    try {
        const response = await IzinCuti.findAll({
            attributes: [
                "id",
                "tipe",
                "tanggal_mulai",
                "tanggal_selesai",
                "alasan",
                "status",
            ],
            where:{
                tipe: "cuti",
            },
            include: [
                {
                    model: Karyawan,
                    required: true,
                    attributes: [
                        "nama_lengkap"
                    ],
                    where: {
                        departemen_id: karyawan.departemen_id,
                        jabatan_id: 2, // Menambahkan filter jabatan_id di sini
                    },
                },
            ],
            order: [["id", "DESC"]], // Menambahkan pengurutan descending
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const getIzinSupervisorByDepartement = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    if (!karyawan) {
        return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    }

    try {
        const response = await IzinCuti.findAll({
            attributes: [
                "id",
                "tipe",
                "tanggal_mulai",
                "tanggal_selesai",
                "alasan",
                "status",
            ],
            where:{
                tipe: "izin",
            },
            include: [
                {
                    model: Karyawan,
                    required: true,
                    attributes: [
                        "nama_lengkap"
                    ],
                    where: {
                        departemen_id: karyawan.departemen_id,
                        jabatan_id: 3, // Menambahkan filter jabatan_id di sini
                    },
                },
            ],
            order: [["id", "DESC"]], // Menambahkan pengurutan descending
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const getCutiSupervisorByDepartement = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    if (!karyawan) {
        return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    }

    try {
        const response = await IzinCuti.findAll({
            attributes: [
                "id",
                "tipe",
                "tanggal_mulai",
                "tanggal_selesai",
                "alasan",
                "status",
            ],
            where:{
                tipe: "cuti",
            },
            include: [
                {
                    model: Karyawan,
                    required: true,
                    attributes: [
                        "nama_lengkap"
                    ],
                    where: {
                        departemen_id: karyawan.departemen_id,
                        jabatan_id: 3, // Menambahkan filter jabatan_id di sini
                    },
                },
            ],
            order: [["id", "DESC"]], // Menambahkan pengurutan descending
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const getIzinManagerByDepartement = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    if (!karyawan) {
        return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    }

    try {
        const response = await IzinCuti.findAll({
            attributes: [
                "id",
                "tipe",
                "tanggal_mulai",
                "tanggal_selesai",
                "alasan",
                "status",
            ],
            where:{
                tipe: "izin",
            },
            include: [
                {
                    model: Karyawan,
                    required: true,
                    attributes: [
                        "nama_lengkap"
                    ],
                    where: {
                        departemen_id: karyawan.departemen_id,
                        jabatan_id: 4, // Menambahkan filter jabatan_id di sini
                    },
                },
            ],
            order: [["id", "DESC"]], // Menambahkan pengurutan descending
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}

export const getCutiManagerByDepartement = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    if (!karyawan) {
        return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    }

    try {
        const response = await IzinCuti.findAll({
            attributes: [
                "id",
                "tipe",
                "tanggal_mulai",
                "tanggal_selesai",
                "alasan",
                "status",
            ],
            where:{
                tipe: "cuti",
            },
            include: [
                {
                    model: Karyawan,
                    required: true,
                    attributes: [
                        "nama_lengkap"
                    ],
                    where: {
                        departemen_id: karyawan.departemen_id,
                        jabatan_id: 4, // Menambahkan filter jabatan_id di sini
                    },
                },
            ],
            order: [["id", "DESC"]], // Menambahkan pengurutan descending
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}