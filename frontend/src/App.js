import { BrowserRouter, Routes, Route } from "react-router-dom"
import Dashboard from "./pages/Dashboard";
import Login from "./components/Login";
import Karyawan from "./pages/Karyawan";
import AddKaryawan from "./pages/AddKaryawan";
import EditKaryawan from "./pages/EditKaryawan";
import Presensi from "./pages/Presensi";
import Jabatan from "./pages/Jabatan";
import AddJabatan from "./pages/AddJabatan"
 
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
      </Routes>
    </BrowserRouter>
  </div>;
}

export default App;
