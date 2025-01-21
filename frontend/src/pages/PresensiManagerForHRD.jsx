import React, {useEffect} from 'react';
import Layout from './Layout';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { getMe } from '../features/authSlice';
import PresensiManagerListForHRD from '../components/PresensiManagerListForHRD';

const PresensiManagerForHRD = () => {

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
        <PresensiManagerListForHRD/>
    </Layout>
  )
}

export default PresensiManagerForHRD;