import express from "express";
import {
    getGolongan,
    createGolongan,
    updateGolongan,
    deleteGolongan
} from "../controllers/Golongan.js";

const router = express.Router();


router.get('/Golongan', getGolongan);
router.post('/Golongan', createGolongan);
router.patch('/Golongan/:id', updateGolongan);
router.delete('/Golongan/:id', deleteGolongan);

export default router;