import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Golongan from "./GolonganModel.js";
import Jabatan from "./JabatanModel.js";
import Departemen from "./DepartemenModel.js";

const { DataTypes } = Sequelize;

const Karyawan = db.define('karyawan', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
    },
    karyawan_id: {
        type: DataTypes.STRING,
        defaultValue: DataTypes.UUIDV4,
        allowNull: false,
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
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true,
            isEmail: true
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
    jabatan_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Jabatan,
            key: 'id'
        }
    },
    golongan_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Golongan,
            key: 'id'
        }
    },
    departemen_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Departemen,
            key: 'id'
        }
    },
    status_karyawan: {
        type: DataTypes.ENUM('aktif', 'nonaktif'),
        allowNull: false
    },

}, {
    freezeTableName: true
});

Jabatan.hasMany(Karyawan, { foreignKey: 'jabatan_id' });
Karyawan.belongsTo(Jabatan, { foreignKey: 'jabatan_id' });

Golongan.hasMany(Karyawan, { foreignKey: 'golongan_id' });
Karyawan.belongsTo(Golongan, { foreignKey: 'golongan_id' });

Departemen.hasMany(Karyawan, { foreignKey: 'departemen_id' });
Karyawan.belongsTo(Departemen, { foreignKey: 'departemen_id' });

export default Karyawan;
