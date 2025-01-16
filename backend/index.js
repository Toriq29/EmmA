import express from "express";
import cors from "cors";
import session from "express-session";
import dotenv from "dotenv";
import db from "./config/Database.js"
import SequelizeStore from "connect-session-sequelize"
import KaryawanRoute from "./routes/KaryawanRoute.js"
import PresensiRoute from "./routes/PresensiRoute.js"
import JabatanRoute from "./routes/JabatanRoute.js"
import GolonganRoute from "./routes/GolonganRoute.js"
import DepartemenRoute from "./routes/DepartemenRoute.js"
import AuthRoute from "./routes/AuthRoute.js"
import IzinCutiRoute from "./routes/IzinCutiRoute.js"
import IzinCuti from "./models/IzinCutiModel.js";

dotenv.config();

const app = express();

const sessionStore = SequelizeStore(session.Store);

const store = new sessionStore({
    db: db
});

// (async()=>{
//     await db.sync()
//     .then(() => {
//         console.log("Database & tables created!");
//     })
//     .catch((error) => console.error("Error creating database & tables: ", error));;
// })();

app.use(session({
    secret: process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    store: store,
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
app.use(PresensiRoute);
app.use(JabatanRoute);
app.use(GolonganRoute);
app.use(DepartemenRoute);
app.use(AuthRoute);
app.use(IzinCutiRoute);

// store.sync();

app.listen(process.env.APP_PORT, () => {
    console.log('server up an running....')
});