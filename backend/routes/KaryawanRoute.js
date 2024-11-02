import express from "express";
import {
    getKaryawan,
    getKaryawanById,
    createKaryawan,
    updateKaryawan,
    deleteKaryawan
} from "../controllers/Karyawan.js";
import { verifyKarywan, adminOnly } from "../middleware/AuthKaryawan.js"

const router = express.Router();


router.get('/karyawan', verifyKarywan, adminOnly, getKaryawan);
router.get('/karyawan/:id', verifyKarywan, adminOnly, getKaryawanById);
router.post('/karyawan', verifyKarywan, adminOnly, createKaryawan);
router.patch('/karyawan/:id', verifyKarywan, adminOnly, updateKaryawan);
router.delete('/karyawan/:id', verifyKarywan, adminOnly, deleteKaryawan);

export default router;