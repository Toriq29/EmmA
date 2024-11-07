import React, {useEffect} from 'react';
import Layout from './Layout';
import FormAddKaryawan from '../components/FormAddKaryawan';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { getMe } from '../features/authSlice';

const AddKaryawan = () => {

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
        <FormAddKaryawan/>
    </Layout>
  )
}

export default AddKaryawan;