import express from "express";
import {
    getKaryawan,
    getKaryawanByKaryawan_id,
    createKaryawan,
    updateKaryawan,
    deleteKaryawan
} from "../controllers/Karyawan.js";

const router = express.Router();


router.get('/karyawan', getKaryawan);
router.get('/karyawan/:karyawan_id', getKaryawanByKaryawan_id);
router.post('/karyawan', createKaryawan);
router.patch('/karyawan/:karyawan_id', updateKaryawan);
router.delete('/karyawan/:karyawan_id', deleteKaryawan);

export default router;