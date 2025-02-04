import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Karyawan from "./KaryawanModel.js";

const { DataTypes } = Sequelize;

const IzinCuti = db.define('izin_cuti', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
    },
    karyawan_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Karyawan,
            key: 'id'
        }
    },
    tipe: {
        type: DataTypes.ENUM('izin', 'cuti'),
        allowNull: false
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
    alasan:{
        type: DataTypes.TEXT,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    status:{
        type: DataTypes.BOOLEAN,
        allowNull: true,
    }

}, {
    freezeTableName: true
});

Karyawan.hasMany(IzinCuti, { foreignKey: 'karyawan_id' });
IzinCuti.belongsTo(Karyawan, { foreignKey: 'karyawan_id' });

export default IzinCuti;
