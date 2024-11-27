import express from "express";
import {
    getGolongan,
    createGolongan,
    updateGolongan,
    deleteGolongan
} from "../controllers/Golongan.js";
import { verifyKarywan, adminOnly } from "../middleware/AuthKaryawan.js"

const router = express.Router();


router.get('/golongan', verifyKarywan, adminOnly, getGolongan);
router.post('/golongan', verifyKarywan, adminOnly, createGolongan);
router.patch('/golongan/:id', verifyKarywan, adminOnly, updateGolongan);
router.delete('/golongan/:id', verifyKarywan, adminOnly, deleteGolongan);

export default router;