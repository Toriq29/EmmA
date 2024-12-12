import { Op } from "sequelize";
import Presensi from "../models/PresensiModel.js";
import Karyawan from "../models/KaryawanModel.js";
import faceapi from "face-api.js";

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

export const createPresensiByKaryawan_id = async (req, res) => {

    const karyawan = await Karyawan.findOne({
        where: {
            karyawan_id: req.params.karyawan_id
        }
    });

    try {
        await Presensi.create({
            karyawan_id: karyawan.id,
            tanggal: new Date().toISOString().split('T')[0], // Mengambil tanggal terbaru (format: YYYY-MM-DD)
            waktu_masuk: new Date().toTimeString().split(' ')[0]

        });
        res.status(201).json({ msg: "Presensi Berhasil" })
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }

}

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

export const faceRecognition = async (req, res) => {

    await Promise.all([
        faceapi.nets.ssdMobilenetv1.loadFromUri('./models'),
        faceapi.nets.faceLandmark68Net.loadFromUri('./models'),
        faceapi.nets.faceRecognitionNet.loadFromUri('./models'),
        faceapi.nets.ageGenderNet.loadFromUri('./models'),
    ])

    //refFace = we KNOW this is Michael Jordan
    const refFace = await faceapi.fetchImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Michael_Jordan_in_2014.jpg/220px-Michael_Jordan_in_2014.jpg')
    const facesToCheck = await faceapi.fetchImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/JordanSmithWorthy2.jpg/170px-JordanSmithWorthy2.jpg')

    //we grab the reference image, and hand it to detectAllFaces method
    let refFaceAiData = await faceapi.detectAllFaces(refFace).withFaceLandmarks().withFaceDescriptors()
    let facesToCheckAiData = await faceapi.detectAllFaces(facesToCheck).withFaceLandmarks().withFaceDescriptors()
    // console.log(faceAIData)

    //we need to make a face matcher!!
    //FaceMatcher is a constructor in faceapi
    //we hand it our reference AI data
    let faceMatcher = new faceapi.FaceMatcher(refFaceAiData)
    facesToCheckAiData = faceapi.resizeResults(facesToCheckAiData, facesToCheck)

    //loop through all of hte faces in our imageToCheck and compare to our reference datta
    facesToCheckAiData.forEach(face => {
        const { detection, descriptor } = face
        //make a label, using the default
        let label = faceMatcher.findBestMatch(descriptor).toString()
        console.log(label)
        if (label.includes("unknown")) {
            return
        }
    })

}