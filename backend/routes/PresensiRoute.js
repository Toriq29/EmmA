import express from "express";

import {
    getPresensi,
    getPresensiByKaryawan_id,
    createPresensiByKaryawan_id
} from "../controllers/Presensi.js"

const router = express.Router();


router.get('/presensi', getPresensi);
router.get('/presensi/:karyawan_id', getPresensiByKaryawan_id);
router.post('/presensi/:karyawan_id', createPresensiByKaryawan_id);

export default router;