import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const { DataTypes } = Sequelize;

const Karyawan = db.define('karyawan', {
    karyawan_id: {
        type: DataTypes.STRING,
        defaultValue: DataTypes.UUIDV4,
        allowNull: false,
        primaryKey: true,
        validate: {
            notEmpty: true
        }
    },
    nama_lengkap: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true,
            len: [3, 100]
        }
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true,
            isEmail: true
        }
    },
    username: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    no_telp: {
        type: DataTypes.STRING,
        allowNull: true
    },
    tanggal_mulai_kerja: {
        type: DataTypes.DATE,
        allowNull: false
    },
    status_karyawan: {
        type: DataTypes.ENUM('aktif', 'nonaktif'),
        allowNull: false
    },
    jabatan_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    golongan_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    departemen_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
}, {
    freezeTableName: true
});

export default Karyawan;
