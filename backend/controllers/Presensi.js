import { Op } from "sequelize";
import {Sequelize} from "sequelize";
import Presensi from "../models/PresensiModel.js";
import Karyawan from "../models/KaryawanModel.js";
import * as faceapi from 'face-api.js';
import canvas from "canvas"
import path from 'path';
import sharp from "sharp";


function base64ToArrayBuffer(base64) {
    var binaryString = atob(base64);
    var bytes = new Uint8Array(binaryString.length);
    for (var i = 0; i < binaryString.length; i++) {
        bytes[i] = binaryString.charCodeAt(i);
    }
    return bytes.buffer;
}

async function resizeImage(buffer, width, height) {
    return await sharp(buffer).resize(width, height).toBuffer();
}

async function validateImageBuffer(buffer) {
    const type = await fileType.fromBuffer(buffer);
    if (!type || !['image/jpeg', 'image/png', 'image/webp'].includes(type.mime)) {
        throw new Error('Unsupported image format');
    }
    return type;
}

export const getPresensi = async (req, res) => {

}

export const getPresensiByKaryawan_id = async (req, res) => {
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            attributes: [
                "karyawan_id",
                "tanggal",
                "waktu_masuk",
                "waktu_keluar",
            ]
        }, {
            where: {
                karyawan_id: karyawan.id
            }
        }
        )
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}



export const getYearPresensiByKaryawan_id = async (req, res) => {
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            attributes: [
                [Sequelize.fn('DISTINCT', Sequelize.col('tahun')), 'tahun']
            ],
            where: {
                karyawan_id: karyawan.id
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const createPresensiByKaryawan_id = async (req, res) => {
    // Mencari data karyawan berdasarkan karyawan_id
    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    if (!karyawan) {
        return res.status(404).json({ msg: "Karyawan tidak ditemukan" });
    }

    try {
        // Mendapatkan tanggal saat ini
        const currentDate = new Date();
        const tanggal = currentDate.getDate(); // Tanggal (1-31)
        const bulan = currentDate.getMonth() + 1; // Bulan (0-11, ditambah 1 agar menjadi 1-12)
        const tahun = currentDate.getFullYear(); // Tahun (contoh: 2024)            

        // Membuat data presensi baru
        await Presensi.create({
            karyawan_id: karyawan.id,
            tanggal: tanggal,
            bulan: bulan,
            tahun: tahun,
            waktu_masuk: currentDate.toTimeString().split(' ')[0] // Format HH:mm:ss
        });

        res.status(201).json({ msg: "Presensi Berhasil" });
    } catch (error) {
        res.status(400).json({ msg: error.message });
    }
};


export const updatePresensiByKaryawan_id = async (req, res) => {

    const tanggal = new Date().toISOString().split('T')[0]

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        await Presensi.update({
            waktu_keluar: new Date().toTimeString().split(' ')[0]
        }, {
            where: {
                karyawan_id: karyawan.id,
                waktu_keluar: { [Op.is]: null }
            }
        }
        );
        res.status(201).json({ msg: "Presensi Updated" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }

}

export const getPresensiJanuaryByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 1 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiFebruaryByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 2 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiMarchByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 3 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiAprilByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 4 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiMayByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 5 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiJuneByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 6 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiJulyByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 7 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiAugustByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 8 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiSeptemberByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 9 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiOctoberByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 10 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiNovemberByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 11 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

export const getPresensiDecemberByKaryawan_idAndYear = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        const response = await Presensi.findAll({
            where: {
                [Op.and]: [
                    { karyawan_id: karyawan.id },
                    { tahun: req.body.tahun },
                    { bulan: 12 },
                ]
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message })
    }
}

// Function to compare two images using face-api.js
export const faceRecognition = async (req, res) => {
    try {
        // const karyawan = await Karyawan.findOne({
        //     attributes: ["photo"], // Get the stored photo from the database
        //     where: { karyawan_id: req.params.id },
        // });
        const karyawan = await Karyawan.findOne({
            attributes: [
                "photo",
            ],
            where: {
                karyawan_id: req.params.karyawan_id
            }
        });

        if (!karyawan) {
            return res.status(404).json({ msg: 'Karyawan not found' });
        }

        // Assuming `photo` is stored as a base64 string in the database
        const dbPhotoBase64 = karyawan.photo;

        // Get the base64 photo from the request body
        const photoBase64 = req.body.photo;

        // console.log("Request Params ID:", req.params.karyawan_id);
        // console.log("Photo from Database:", karyawan ? karyawan.photo : null);
        // console.log("Photo from body:", photoBase64);



        if (!photoBase64 || !dbPhotoBase64) {
            return res.status(400).json({ msg: "Photo data is missing" });
        }

        const sanitizeBase64 = (base64) => {
            if (!base64 || typeof base64 !== 'string') {
                return ''; // Jika tidak valid, kembalikan string kosong
            }
            return base64.replace(/[^A-Za-z0-9+/=]/g, '');
        };

        const sanitizedPhotoBase64 = sanitizeBase64(photoBase64);
        const sanitizedDbPhotoBase64 = sanitizeBase64(dbPhotoBase64);

        // Convert the base64 to buffer (in case you're comparing image files)
        const imgBuffer = base64ToArrayBuffer(sanitizedPhotoBase64);
        const dbImgBuffer = base64ToArrayBuffer(sanitizedDbPhotoBase64)

        // // Di dalam fungsi faceRecognition
        // const resizedImgBuffer = await resizeImage(imgBuffer, 150, 150); // Resize ke 150x150
        // const resizedDbImgBuffer = await resizeImage(dbImgBuffer, 150, 150);

        // Load the models for face-api.js
        await faceapi.nets.ssdMobilenetv1.loadFromDisk(path.join('../backend/public/models'), { minConfidence: 0.5 });  // Path to your pre-trained models
        await faceapi.nets.faceLandmark68Net.loadFromDisk(path.join('../backend/public/models'), { minConfidence: 0.5 });
        await faceapi.nets.faceRecognitionNet.loadFromDisk(path.join('../backend/public/models'), { minConfidence: 0.5 });


        // Convert buffer ke canvas setelah resize
        const receivedImg = await canvas.loadImage(imgBuffer);
        const dbImg = await canvas.loadImage(dbImgBuffer);

        // Detect faces in both images
        const receivedDetected = await faceapi.detectSingleFace(receivedImg).withFaceLandmarks().withFaceDescriptor();
        const dbDetected = await faceapi.detectSingleFace(dbImg).withFaceLandmarks().withFaceDescriptor();

        if (!receivedDetected || !dbDetected) {
            return res.status(400).json({ msg: 'Face not detected in one or both images' });
        }

        // Compare face descriptors to check similarity
        const distance = faceapi.euclideanDistance(receivedDetected.descriptor, dbDetected.descriptor);

        // Define a threshold for face similarity (0.6 is common for most applications)
        if (distance < 0.6) {
            res.status(200).json({ msg: 'Face recognized' });
        } else {
            res.status(400).json({ msg: 'Face not recognized' });
        }

    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: error.message });
    }
};