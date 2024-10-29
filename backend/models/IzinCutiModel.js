import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Karyawan from "./KaryawanModel.js";

const { DataTypes } = Sequelize;

const IzinCuti = db.define('izin_cuti', {
    izin_cuti_id: {
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
    tanggal_mulai: {
        type: DataTypes.DATE,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    tanggal_selesai: {
        type: DataTypes.DATE,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    jenis_izin:{
        type: DataTypes.ENUM('Cuti', 'Sakit'),
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    status:{
        type: DataTypes.BOOLEAN,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    }

}, {
    freezeTableName: true
});

Karyawan.hasMany(IzinCuti, { foreignKey: 'karyawan_id' });
IzinCuti.belongsTo(Karyawan, { foreignKey: 'karyawan_id' });

export default IzinCuti;
