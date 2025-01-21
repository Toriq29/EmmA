import express from "express";
import {
    getKaryawan,
    getKaryawanById,
    createKaryawan,
    updateKaryawan,
    deleteKaryawan,
    addPhoto,
    getPhotoById,
    getKaryawanByDepartement,
    getSupervisorByDepartement,
    getManagerByDepartement

} from "../controllers/Karyawan.js";
import { verifyKarywan, adminOnly } from "../middleware/AuthKaryawan.js"

const router = express.Router();


router.get('/karyawan', verifyKarywan, adminOnly, getKaryawan);
router.get('/karyawan/:id', verifyKarywan, getKaryawanById);
router.post('/karyawan', verifyKarywan, adminOnly, createKaryawan);
router.patch('/karyawan/:id', verifyKarywan, adminOnly, updateKaryawan);
router.delete('/karyawan/:id', verifyKarywan, adminOnly, deleteKaryawan);
router.get('/karyawan/photo/:id', verifyKarywan, getPhotoById);
router.patch('/karyawan/add_photo/:id', verifyKarywan, addPhoto);
router.post('/karyawanByDepartement/:id', verifyKarywan, getKaryawanByDepartement);
router.post('/supervisorByDepartement/:id', verifyKarywan, getSupervisorByDepartement);
router.post('/managerByDepartement/:id', verifyKarywan, getManagerByDepartement);


export default router;