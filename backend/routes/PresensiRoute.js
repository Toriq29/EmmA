import express from "express";

import {
    getPresensi,
    getPresensiByKaryawan_id,
    createPresensiByKaryawan_id,
    updatePresensiByKaryawan_id,
    faceRecognition
} from "../controllers/Presensi.js"

const router = express.Router();


router.get('/presensi', getPresensi);
router.get('/presensi/:karyawan_id', getPresensiByKaryawan_id);
router.post('/presensi/:karyawan_id', createPresensiByKaryawan_id);
router.patch('/presensi/:karyawan_id', updatePresensiByKaryawan_id);
router.get('/facerecog', faceRecognition);

export default router;