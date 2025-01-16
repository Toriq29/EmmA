import express from "express";
import {
    createIzin,
    createCuti,
    AcceptIzinCuti,
    RejectIzinCuti,
    getIzinByKaryawan_Id,
    getCutiByKaryawan_Id

} from "../controllers/IzinCuti.js";
import { verifyKarywan, adminOnly } from "../middleware/AuthKaryawan.js"

const router = express.Router();

router.get('/izin/:karyawan_id', getIzinByKaryawan_Id);
router.get('/cuti/:karyawan_id', getCutiByKaryawan_Id);
router.post('/izin/:karyawan_id', createIzin);
router.post('/cuti/:karyawan_id', createCuti);
router.patch('/izincuti/diterima/:id', AcceptIzinCuti);
router.patch('/izincuti/ditolak/:id', RejectIzinCuti);


export default router;