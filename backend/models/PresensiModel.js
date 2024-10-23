import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Karyawan from "./KaryawanModel.js";

const { DataTypes } = Sequelize;

const Presensi = db.define('presensi', {
    presensi_id: {
        type: DataTypes.STRING,
        defaultValue: DataTypes.UUIDV4,
        allowNull: false,
        primaryKey: true,
        validate: {
            notEmpty: true
        }
    },
    karyawan_id: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    lokasi_presensi: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    waktu_masuk: {
        type: DataTypes.TIME,
        allowNull: false
    },
    waktu_keluar: {
        type: DataTypes.TIME,
        allowNull: true
    },
    tanggal: {
        type: DataTypes.DATE,
        allowNull: false
    }
}, {
    freezeTableName: true
});

// Relasi antara Karyawan dan Presensi
Karyawan.hasMany(Presensi, { foreignKey: 'karyawan_id' });
Presensi.belongsTo(Karyawan, { foreignKey: 'karyawan_id' });

export default Presensi;
