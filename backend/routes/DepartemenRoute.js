import express from "express";
import {
    getDepartemen,
    createDepartemen,
    updateDepartemen,
    deleteDepartemen
} from "../controllers/Departemen.js";
import { verifyKarywan, adminOnly } from "../middleware/AuthKaryawan.js"

const router = express.Router();


router.get('/departemen', verifyKarywan, adminOnly, getDepartemen);
router.post('/departemen', verifyKarywan, adminOnly, createDepartemen);
router.patch('/departemen/:id', verifyKarywan, adminOnly, updateDepartemen);
router.delete('/departemen/:id', verifyKarywan, adminOnly, deleteDepartemen);

export default router;