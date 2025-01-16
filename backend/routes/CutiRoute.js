import express from "express";
import {
    createCuti,
    AcceptCuti,
    RejectCuti

} from "../controllers/Cuti.js";
import { verifyKarywan, adminOnly } from "../middleware/AuthKaryawan.js"

const router = express.Router();


router.post('/cuti/:karyawan_id', createCuti);
router.patch('/cuti/diterima/:id', AcceptCuti);
router.patch('/cuti/ditolak/:id', RejectCuti);


export default router;