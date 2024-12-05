import React, {useEffect} from 'react';
import Layout from './Layout';
import GolonganList from '../components/GolonganList';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { getMe } from '../features/authSlice';

const Golongan = () => {

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
    if (karyawan && karyawan.jabatan_id !== 1) {
      navigate("/dashboard")
    }
  }, [isError, navigate, karyawan]);

  return (
    <Layout>
        <GolonganList/>
    </Layout>
  )
}

export default Golongan;