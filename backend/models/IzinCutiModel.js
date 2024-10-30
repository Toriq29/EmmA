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
