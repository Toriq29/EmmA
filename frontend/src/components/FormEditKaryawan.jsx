import React from 'react'

const FormEditKaryawan = () => {
    return (
        <div>
            <h1 className='title' style={{ color: "black" }}>Karyawan</h1>
            <h2 className='subtitle' style={{ color: "black" }}>Edit Data Karyawan</h2>
            <div className="card is-shadowless">
                <div className="card-content">
                    <div className="content">
                        <form>
                            <div className="field">
                                <label className="label">Nama Lengkap</label>
                                <div className="control">
                                    <input type="text" className="input" placeholder='Nama' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Username</label>
                                <div className="control">
                                    <input type="text" className="input" placeholder='Username' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Password</label>
                                <div className="control">
                                    <input type="password" className="input" placeholder='******' />
                                </div>
                            </div><div className="field">
                                <label className="label">Confirm Password</label>
                                <div className="control">
                                    <input type="password" className="input" placeholder='******' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Email</label>
                                <div className="control">
                                    <input type="text" className="input" placeholder='Email' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">No Telpon</label>
                                <div className="control">
                                    <input type="text" className="input" placeholder='No Telpon' />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Tanggal Mulai Kerja</label>
                                <div className="control">
                                    <input type="date" className="input" />
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Jabatan</label>
                                <div className="control">
                                    <div className="select is-fullwidth">
                                        <select>
                                            <option value="1">Admin</option>
                                            <option value="2">Karyawan</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Golongan</label>
                                <div className="control">
                                    <div className="select is-fullwidth">
                                        <select>
                                            <option value="1">Admin</option>
                                            <option value="2">Grade 1</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="field">
                                <label className="label">Departemen</label>
                                <div className="control">
                                    <div className="select is-fullwidth">
                                        <select>
                                            <option value="1">Admin</option>
                                            <option value="2">Cyber Security</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="field">
                                <div className="control">
                                    <button className="button is-success">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default FormEditKaryawan