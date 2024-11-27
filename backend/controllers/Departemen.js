import Departemen from "../models/DepartemenModel.js"

export const getDepartemen = async(req, res) => {
    try {
        const response = await Departemen.findAll({
            attributes: [
                "id", 
                "nama_departemen",
            ]
        })
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message})
    }
}

export const createDepartemen = async(req, res) => {
    const {
        id, 
        nama_departemen,
    } = req.body;

    try {
        await Departemen.create({
            id: id,
            nama_departemen: nama_departemen,
        });
        res.status(201).json({msg: "Departemen Berhasil Dibuat"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }

}

export const updateDepartemen = async(req, res) => {
    const departemen = await Departemen.findOne({
        where: {
            id: req.params.id
        }
    });
    if(!departemen) return res.status(404).json({msg: "Departemen Tidak Ditemukan"});
    
    const {
        nama_departemen, 
    } = req.body;

    try {
        await Departemen.update({
            nama_departemen: nama_departemen,
        },{
            where: {
                id: departemen.id
            }
        }
    );
        res.status(200).json({msg: "Departemen Updated"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }
}

export const deleteDepartemen = async(req, res) => {
    const departemen = await Departemen.findOne({
        where: {
            id: req.params.id
        }
    });
    if(!departemen) return res.status(404).json({msg: "Departemen Tidak Ditemukan"});
    try {
        await Departemen.destroy({
            where: {
                id: departemen.id
            }
        });
        res.status(200).json({msg: "Departemen Deleted"})
    } catch (error) {
        res.status(400).json({msg: error.message})
    }
}