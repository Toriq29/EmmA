import express from "express";
import {
    getJabatan,
    createJabatan,
    updateJabatan,
    deleteJabatan,
    getJabatanWithJabatanId
} from "../controllers/Jabatan.js";
import { verifyKarywan, adminOnly } from "../middleware/AuthKaryawan.js"

const router = express.Router();


router.get('/jabatan', verifyKarywan, adminOnly, getJabatan);
router.get('/jabatan/:id', verifyKarywan, adminOnly, getJabatanWithJabatanId);
router.post('/jabatan', verifyKarywan, adminOnly, createJabatan);
router.patch('/jabatan/:id', verifyKarywan, adminOnly, updateJabatan);
router.delete('/jabatan/:id', verifyKarywan, adminOnly, deleteJabatan);

export default router;