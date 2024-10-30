import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Karyawan from "./KaryawanModel.js";

const { DataTypes } = Sequelize;

const Presensi = db.define('presensi', {
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
    tanggal: {
        type: DataTypes.DATE,
        allowNull: false
    },
    waktu_masuk: {
        type: DataTypes.TIME,
        allowNull: false
    },
    waktu_keluar: {
        type: DataTypes.TIME,
        allowNull: true
    }

}, {
    freezeTableName: true
});


Karyawan.hasMany(Presensi, { foreignKey: 'karyawan_id' });
Presensi.belongsTo(Karyawan, { foreignKey: 'karyawan_id' });

export default Presensi;
