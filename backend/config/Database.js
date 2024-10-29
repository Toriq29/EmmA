import { Sequelize } from "sequelize";

const db = new Sequelize('tubes_db', 'root', '', {
    host: "localhost",
    dialect: "mysql"
});

export default db;