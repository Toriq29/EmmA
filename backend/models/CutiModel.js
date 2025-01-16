import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Karyawan from "./KaryawanModel.js";

const { DataTypes } = Sequelize;

const Cuti = db.define('cuti', {
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

Karyawan.hasMany(Cuti, { foreignKey: 'karyawan_id' });
Cuti.belongsTo(Karyawan, { foreignKey: 'karyawan_id' });

export default Cuti;
