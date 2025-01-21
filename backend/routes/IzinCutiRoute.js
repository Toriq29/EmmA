import express from "express";
import {
    createIzinCuti,
    createCuti,
    AcceptIzinCuti,
    RejectIzinCuti,
    getIzinByKaryawan_Id,
    getCutiByKaryawan_Id,
    getIzinKaryawanByDepartement,
    getCutiKaryawanByDepartement,
    getIzinSupervisorByDepartement,
    getCutiSupervisorByDepartement,
    getIzinManagerByDepartement,
    getCutiManagerByDepartement

} from "../controllers/IzinCuti.js";
import { verifyKarywan, adminOnly } from "../middleware/AuthKaryawan.js"

const router = express.Router();

router.get('/izin/:karyawan_id', getIzinByKaryawan_Id);
router.get('/cuti/:karyawan_id', getCutiByKaryawan_Id);
router.post('/izincuti/:karyawan_id', createIzinCuti);
router.post('/cuti/:karyawan_id', createCuti);
router.patch('/izincuti/diterima/:id', AcceptIzinCuti);
router.patch('/izincuti/ditolak/:id', RejectIzinCuti);
router.get('/izinKaryawanbyDepartemen/:karyawan_id', getIzinKaryawanByDepartement);
router.get('/cutiKaryawanbyDepartemen/:karyawan_id', getCutiKaryawanByDepartement);
router.get('/izinSupervisorbyDepartemen/:karyawan_id', getIzinSupervisorByDepartement);
router.get('/cutiSupervisorbyDepartemen/:karyawan_id', getCutiSupervisorByDepartement);
router.get('/izinManagerbyDepartemen/:karyawan_id', getIzinManagerByDepartement);
router.get('/cutiManagerbyDepartemen/:karyawan_id', getCutiManagerByDepartement);



export default router;