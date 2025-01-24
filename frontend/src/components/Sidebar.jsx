import React from 'react'
import { NavLink, useNavigate } from "react-router-dom"
import { IoPerson, IoHome, IoLogOut, IoCheckmarkCircleOutline, IoDocumentAttach, IoDocument, IoPeople, IoCalendarClearOutline, IoCalendar, IoPauseCircle, IoCut, IoStop, IoCheckmarkDone } from "react-icons/io5";
import { useDispatch, useSelector } from 'react-redux';
import { LogOut, reset } from "../features/authSlice";

const Sidebar = () => {
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const { karyawan } = useSelector((state) => state.auth);

    const logout = () => {
        dispatch(LogOut());
        dispatch(reset());
        navigate("/");
    }

    return (
        <div>
            <aside className="menu pl-2 has-shadow">
                <p className="menu-label">General</p>
                <ul className="menu-list">
                    <li><NavLink to="/dashboard"><IoHome /> Dashboard</NavLink></li>
                </ul>
                {karyawan && karyawan.jabatan_id === 1 && (
                    <div>
                        <p className="menu-label">Admin</p>
                        <ul className="menu-list">
                            <li><NavLink to="/karyawan"><IoPeople /> Karyawan</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/jabatan"><IoPerson /> Jabatan</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/golongan"><IoPerson /> Golongan</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/departemen"><IoPerson /> Departemen</NavLink></li>
                        </ul>
                    </div>
                )}

                {karyawan && karyawan.jabatan_id === 2 && (
                    <div>
                        <p className="menu-label">Karyawan</p>
                        <ul className="menu-list">
                            <li><NavLink to="/presensi"><IoCheckmarkCircleOutline /> Presensi</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={`/presensiKaryawan/year/${karyawan.karyawan_id}`} ><IoCalendar /> List Presensi</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/izincuti"} ><IoStop /> Izin dan Cuti</NavLink></li>
                        </ul>
                        {/* <ul className="menu-list">
                            <li><NavLink to="/photo"><IoCheckmarkCircleOutline /> Simpan Foto Presensi</NavLink></li>
                        </ul> */}
                    </div>
                )}

                {karyawan && karyawan.jabatan_id === 3 && (
                    <div>
                        <p className="menu-label">Supervisor</p>
                        <ul className="menu-list">
                            <li><NavLink to="/presensi"><IoCheckmarkCircleOutline /> Presensi</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={`/presensiKaryawan/year/${karyawan.karyawan_id}`} ><IoCalendar /> List Presensi</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/presensiKaryawan"><IoPeople /> List Presensi Karyawan</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/izincuti"} ><IoStop /> Izin dan Cuti</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/persetujuanIzinCuti"} ><IoCheckmarkDone /> Persetujuan Izin dan Cuti Karyawan</NavLink></li>
                        </ul>
                        {/* <ul className="menu-list">
                            <li><NavLink to="/photo"><IoCheckmarkCircleOutline /> Simpan Foto Presensi</NavLink></li>
                        </ul> */}
                    </div>
                )}
                {karyawan && karyawan.jabatan_id === 4 && (
                    <div>
                        <p className="menu-label">Manager</p>
                        <ul className="menu-list">
                            <li><NavLink to="/presensi"><IoCheckmarkCircleOutline /> Presensi</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={`/presensiKaryawan/year/${karyawan.karyawan_id}`} ><IoCalendar /> List Presensi</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/presensiKaryawan"><IoPeople /> List Presensi Karyawan</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/presensiSupervisor"><IoPeople /> List Presensi Supervisor</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/izincuti"} ><IoStop /> Izin dan Cuti</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/persetujuanIzinCuti"} ><IoStop /> List Izin dan Cuti Karyawan</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/persetujuanIzinCutiSupervisor"} ><IoCheckmarkDone /> Persetujuan List Izin dan Cuti Supervisor</NavLink></li>
                        </ul>
                        {/* <ul className="menu-list">
                            <li><NavLink to="/photo"><IoCheckmarkCircleOutline /> Simpan Foto Presensi</NavLink></li>
                        </ul> */}
                    </div>
                )}
                {karyawan && karyawan.jabatan_id === 5 && (
                    <div>
                        <p className="menu-label">Human Resource Development</p>
                        <ul className="menu-list">
                            <li><NavLink to="/presensi"><IoCheckmarkCircleOutline /> Presensi</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={`/presensiKaryawan/year/${karyawan.karyawan_id}`} ><IoCalendar /> List Presensi</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/presensiKaryawan"><IoPeople /> List Presensi Karyawan</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/presensiSupervisor"><IoPeople /> List Presensi Supervisor</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to="/presensiManager"><IoPeople /> List Presensi Manager</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/izincuti"} ><IoStop /> Izin dan Cuti</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/persetujuanIzinCuti"} ><IoStop /> List Izin dan Cuti Karyawan</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/persetujuanIzinCutiSupervisor"} ><IoStop /> List Izin dan Cuti Supervisor</NavLink></li>
                        </ul>
                        <ul className="menu-list">
                            <li><NavLink to={"/persetujuanIzinCutiManager"} ><IoCheckmarkDone /> Persetujuan List Izin dan Cuti Manager</NavLink></li>
                        </ul>
                        {/* <ul className="menu-list">
                            <li><NavLink to="/photo"><IoCheckmarkCircleOutline /> Simpan Foto Presensi</NavLink></li>
                        </ul> */}
                    </div>
                )}

                <p className="menu-label">Pengaturan</p>
                <ul className="menu-list">
                    <li><NavLink to="/profile"><IoPerson /> Profile</NavLink></li>
                </ul>
                <ul className="menu-list">
                    <li><button onClick={logout} className="button is-white"><IoLogOut /> Logout</button></li>
                </ul>
            </aside>
        </div>
    )
}

export default Sidebar