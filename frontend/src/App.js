import { BrowserRouter, Routes, Route } from "react-router-dom"
import Dashboard from "./pages/Dashboard";
import Login from "./components/Login";
import Karyawan from "./pages/Karyawan";
import AddKaryawan from "./pages/AddKaryawan";
import EditKaryawan from "./pages/EditKaryawan";
import Presensi from "./pages/Presensi";
import Jabatan from "./pages/Jabatan";
import AddJabatan from "./pages/AddJabatan"
import Golongan from "./pages/Golongan";
import AddGolongan from "./pages/AddGolongan";
import Departemen from "./pages/Departemen";
import AddDepartemen from "./pages/AddDepartemen";
import Photo from "./pages/Photo";
import PresensiKaryawanForSupervisor from "./pages/PresensiKaryawanForSupervisor";
import PresensiYearKaryawanForSupervisor from "./pages/PresensiYearKaryawanForSupervisor";
import PresensiForSupervisor from "./pages/PresensiForSupervisor";
import PresensiSupervisorForManager from "./pages/PresensiSupervisorForManager";
import Profile from "./pages/Profile";
import IzinCuti from "./pages/IzinCuti";
import AddIzinCuti from "./pages/AddIzinCuti"
import PersetujuanIzinCuti from "./pages/PersetujuanIzinCuti";
import PersetujuanIzinCutiSupervisor from "./pages/PersetujuanIzinCutiSupervisor";
import PresensiManagerForHRD from "./pages/PresensiManagerForHRD";
import PersetujuanIzinCutiManager from "./pages/PersetujuanIzinCutiManager";


function App() {
  return <div>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/karyawan" element={<Karyawan />} />
        <Route path="/karyawan/add" element={<AddKaryawan />} />
        <Route path="/karyawan/edit/:id" element={<EditKaryawan />} />
        <Route path="/presensi" element={<Presensi />} />
        <Route path="/jabatan" element={<Jabatan />} />
        <Route path="/jabatan/add" element={<AddJabatan />} />
        <Route path="/golongan" element={<Golongan />} />
        <Route path="/golongan/add" element={<AddGolongan />} />
        <Route path="/departemen" element={<Departemen />} />
        <Route path="/departemen/add" element={<AddDepartemen />} />
        <Route path="/photo" element={<Photo />} />
        <Route path="/presensiKaryawan" element={<PresensiKaryawanForSupervisor />} />
        <Route path="/presensiSupervisor" element={<PresensiSupervisorForManager />} />
        <Route path="/presensiManager" element={<PresensiManagerForHRD />} />
        <Route path="/presensiKaryawan/year/:id" element={<PresensiYearKaryawanForSupervisor />} />
        <Route path="/presensiKaryawan/detail/:id/:year" element={<PresensiForSupervisor />} />
        <Route path="/profile" element={<Profile />} />
        <Route path="/izincuti" element={<IzinCuti />} />
        <Route path="/izincuti/add" element={<AddIzinCuti />} />
        <Route path="/persetujuanIzinCuti" element={<PersetujuanIzinCuti />} />
        <Route path="/persetujuanIzinCutiSupervisor" element={<PersetujuanIzinCutiSupervisor />} />
        <Route path="/persetujuanIzinCutiManager" element={<PersetujuanIzinCutiManager />} />
      </Routes>
    </BrowserRouter>
  </div>;
}

export default App;
