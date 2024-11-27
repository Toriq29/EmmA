import Jabatan from "../models/JabatanModel.js"

export const getJabatan = async(req, res) => {
    try {
        const response = await Jabatan.findAll({
            attributes: [
                "id", 
                "nama_jabatan",
            ]
        })
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message})
    }
}

export const createJabatan = async(req, res) => {
    const {
        id, 
        nama_jabatan,
    } = req.body;

    try {
        await Jabatan.create({
            id: id,
            nama_jabatan: nama_jabatan,
        });
        res.status(201).json({msg: "Jabatan Berhasil Dibuat"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }
}

export const updateJabatan = async(req, res) => {
    const jabatan = await Jabatan.findOne({
        where: {
            id: req.params.id
        }
    });
    if(!jabatan) return res.status(404).json({msg: "Jabatan Tidak Ditemukan"});
    
    const {
        nama_jabatan, 
    } = req.body;

    try {
        await Jabatan.update({
            nama_jabatan: nama_jabatan,
        },{
            where: {
                id: jabatan.id
            }
        }
    );
        res.status(200).json({msg: "Jabatan Updated"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }
}

export const deleteJabatan = async(req, res) => {
    const jabatan = await Jabatan.findOne({
        where: {
            id: req.params.id
        }
    });
    if(!jabatan) return res.status(404).json({msg: "Jabatan Tidak Ditemukan"});
    try {
        await jabatan.destroy({
            where: {
                id: jabatan.id
            }
        });
        res.status(200).json({msg: "Jabatan Deleted"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }
}