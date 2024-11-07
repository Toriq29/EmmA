import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { LoginKaryawan, reset, getMe } from "../features/authSlice";


const Login = () => {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const { karyawan, isError, isSuccess, isLoading, message } = useSelector(
        (state) => state.auth
    );

    useEffect(() => {
        dispatch(getMe());
    }, [dispatch]);


    useEffect(() => {
        if (karyawan || isSuccess) {
            navigate("/dashboard")
        }
        dispatch(reset());

    }, [karyawan, isSuccess, dispatch, navigate]);

    const Auth = (e) => {
        e.preventDefault();
        dispatch(LoginKaryawan({ username, password }));
    }

    return (
        <section className="hero has-background-grey-light is-fullheight is-fullwidth">
            <div className="hero-body">
                <div className="container">
                    <div className="columns is-centered">
                        <div className="column is-4">
                            <form onSubmit={Auth} className='box'>
                                <h1 className='title is-1 has-text-centered'>EmmA.</h1>
                                <h2 className='title is-3'>Sign In</h2>

                                <div className="field">
                                    <label className="label">Username</label>
                                    <div className="control">
                                        <input type="text" className="input" value={username} onChange={(e) => setUsername(e.target.value)} placeholder='username' />
                                    </div>
                                </div>
                                <div className="field">
                                    <label className="label">Password</label>
                                    <div className="control">
                                        <input type="password" className="input" value={password} onChange={(e) => setPassword(e.target.value)} placeholder='******' />
                                    </div>
                                </div>
                                <div className="field mt-5">
                                    <button type="submit" className="button is-success is-fullwidth">{isLoading ? 'Loading...' : "Login"}</button>
                                </div>
                                {isError && <p className='has-text-centered mb-1' >{message}</p>}
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default Login;