import express from "express";
import {
    getDepartemen,
    createDepartemen,
    updateDepartemen,
    deleteDepartemen
} from "../controllers/Departemen.js";

const router = express.Router();


router.get('/Departemen', getDepartemen);
router.post('/Departemen', createDepartemen);
router.patch('/Departemen/:id', updateDepartemen);
router.delete('/Departemen/:id', deleteDepartemen);

export default router;