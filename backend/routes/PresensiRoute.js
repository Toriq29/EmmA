import express from "express";

import {
    getPresensi,
    getPresensiByKaryawan_id,
    createPresensiByKaryawan_id,
    updatePresensiByKaryawan_id,
    faceRecognition,
    getYearPresensiByKaryawan_id,
    getPresensiJanuaryByKaryawan_idAndYear,
    getPresensiFebruaryByKaryawan_idAndYear,
    getPresensiMarchByKaryawan_idAndYear,
    getPresensiAprilByKaryawan_idAndYear,
    getPresensiMayByKaryawan_idAndYear,
    getPresensiJuneByKaryawan_idAndYear,
    getPresensiJulyByKaryawan_idAndYear,
    getPresensiSeptemberByKaryawan_idAndYear,
    getPresensiOctoberByKaryawan_idAndYear,
    getPresensiNovemberByKaryawan_idAndYear,
    getPresensiDecemberByKaryawan_idAndYear,
    getPresensiAugustByKaryawan_idAndYear,
} from "../controllers/Presensi.js"
import { verifyKarywan } from "../middleware/AuthKaryawan.js"

const router = express.Router();


router.get('/presensi', getPresensi);
router.post('/presensi/:karyawan_id', verifyKarywan, createPresensiByKaryawan_id);
router.patch('/presensi/:karyawan_id', verifyKarywan, updatePresensiByKaryawan_id);
router.post('/yearPresensi/:karyawan_id', verifyKarywan, getYearPresensiByKaryawan_id);
router.post('/facerecog/:karyawan_id', verifyKarywan, faceRecognition);
router.post('/presensi/january/:karyawan_id', verifyKarywan, getPresensiJanuaryByKaryawan_idAndYear);
router.post('/presensi/february/:karyawan_id', verifyKarywan, getPresensiFebruaryByKaryawan_idAndYear);
router.post('/presensi/march/:karyawan_id', verifyKarywan, getPresensiMarchByKaryawan_idAndYear);
router.post('/presensi/april/:karyawan_id', getPresensiAprilByKaryawan_idAndYear);
router.post('/presensi/may/:karyawan_id', verifyKarywan, getPresensiMayByKaryawan_idAndYear);
router.post('/presensi/june/:karyawan_id', verifyKarywan, getPresensiJuneByKaryawan_idAndYear);
router.post('/presensi/july/:karyawan_id', verifyKarywan, getPresensiJulyByKaryawan_idAndYear);
router.post('/presensi/august/:karyawan_id', verifyKarywan, getPresensiAugustByKaryawan_idAndYear);
router.post('/presensi/september/:karyawan_id', verifyKarywan, getPresensiSeptemberByKaryawan_idAndYear);
router.post('/presensi/october/:karyawan_id', verifyKarywan, getPresensiOctoberByKaryawan_idAndYear);
router.post('/presensi/november/:karyawan_id', verifyKarywan, getPresensiNovemberByKaryawan_idAndYear);
router.post('/presensi/december/:karyawan_id', verifyKarywan, getPresensiDecemberByKaryawan_idAndYear);


export default router;