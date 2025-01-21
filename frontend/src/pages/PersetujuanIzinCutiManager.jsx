import React, { useEffect } from 'react';
import Layout from './Layout';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { getMe } from '../features/authSlice';
import PersetujuanIzinCutiListManager from '../components/PersetujuanIzinCutiListManager';

const PersetujuanIzinCutiManager = () => {

    const dispatch = useDispatch();
    const navigate = useNavigate();
    const { isError, karyawan } = useSelector((state => state.auth));

    useEffect(() => {
        dispatch(getMe());
    }, [dispatch]);

    useEffect(() => {
        if (isError) {
            navigate("/");
        }
    }, [isError, navigate, karyawan]);

    return (
        <Layout>
            <PersetujuanIzinCutiListManager />
        </Layout>
    )
}

export default PersetujuanIzinCutiManager;