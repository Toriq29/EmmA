import Golongan from "../models/GolonganModel.js"

export const getGolongan = async(req, res) => {
    try {
        const response = await Golongan.findAll({
            attributes: [
                "id", 
                "nama_golongan",
            ]
        })
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message})
    }
}

export const createGolongan = async(req, res) => {
    const {
        id, 
        nama_golongan,
    } = req.body;

    try {
        await Golongan.create({
            id: id,
            nama_golongan: nama_golongan,
        });
        res.status(201).json({msg: "Golongan Berhasil Dibuat"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }

}

export const updateGolongan = async(req, res) => {
    const golongan = await Golongan.findOne({
        where: {
            id: req.params.id
        }
    });
    if(!golongan) return res.status(404).json({msg: "Golongan Tidak Ditemukan"});
    
    const {
        nama_golongan, 
    } = req.body;

    try {
        await Golongan.update({
            nama_golongan: nama_golongan,
        },{
            where: {
                id: golongan.id
            }
        }
    );
        res.status(200).json({msg: "Golongan Updated"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }
}

export const deleteGolongan = async(req, res) => {
    const golongan = await Golongan.findOne({
        where: {
            id: req.params.id
        }
    });
    if(!golongan) return res.status(404).json({msg: "Golongan Tidak Ditemukan"});
    try {
        await Golongan.destroy({
            where: {
                id: golongan.id
            }
        });
        res.status(200).json({msg: "Golongan Deleted"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }
}