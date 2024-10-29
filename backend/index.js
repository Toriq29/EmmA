import express from "express";
import cors from "cors";
import session from "express-session";
import dotenv from "dotenv";
import db from "./config/Database.js"
import KaryawanRoute from "./routes/KaryawanRoute.js"
import PresensiRoute from "./routes/PresensiRoute.js"
import IzinCuti from "./models/IzinCutiModel.js";

dotenv.config();

const app = express();

(async()=>{
    await db.sync()
    .then(() => {
        console.log("Database & tables created!");
    })
    .catch((error) => console.error("Error creating database & tables: ", error));;
})();

app.use(session({
    secret: process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    cookie: {
        secure: 'auto'
    }
}))

app.use(cors({
    credentials: true,
    origin: 'http://localhost:3000'
}))

app.use(express.json());
app.use(KaryawanRoute);
app.use(PresensiRoute)

app.listen(process.env.APP_PORT, () => {
    console.log('server up an running....')
});