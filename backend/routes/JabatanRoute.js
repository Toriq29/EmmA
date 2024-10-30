import express from "express";
import {
    getJabatan,
    createJabatan,
    updateJabatan,
    deleteJabatan
} from "../controllers/Jabatan.js";

const router = express.Router();


router.get('/Jabatan', getJabatan);
router.post('/Jabatan', createJabatan);
router.patch('/Jabatan/:id', updateJabatan);
router.delete('/Jabatan/:id', deleteJabatan);

export default router;