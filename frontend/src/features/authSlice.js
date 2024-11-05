import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

const initialState = {
    karyawan: null,
    isError: false,
    isSuccess: false,
    isLoading: false,
    message: ""
}

export const LoginKaryawan = createAsyncThunk("karyawan/LoginKaryawan", async (karyawan, thunkAPI) => {
    try {
        const response = await axios.post("http://localhost:5000/login", {
            username: karyawan.username,
            password: karyawan.password
        });
        return response.data
    } catch (error) {
        if (error.response) {
            const message = error.response.data.msg;
            return thunkAPI.rejectWithValue(message);

        }
    }
});

export const getMe = createAsyncThunk("karyawan/getMe", async (_, thunkAPI) => {
    try {
        const response = await axios.get("http://localhost:5000/me");
        return response.data;
    } catch (error) {
        if (error.response) {
            const message = error.response.data.msg;
            return thunkAPI.rejectWithValue(message);
        }
    }
});

export const LogOut = createAsyncThunk("karyawan/LogOut", async () => {
    await axios.delete("http://localhost:5000/logout");
})

export const authSlice = createSlice({
    name: "auth",
    initialState,
    reducers: {
        reset: (state) => initialState
    },
    extraReducers: (builder) => {
        builder.addCase(LoginKaryawan.pending, (state) => {
            state.isLoading = true;
        });
        builder.addCase(LoginKaryawan.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isSuccess = true;
            state.karyawan = action.payload;
        });
        builder.addCase(LoginKaryawan.rejected, (state, action) => {
            state.isLoading = false;
            state.isError = true;
            state.message = action.payload;
        });

        // Get Karyawan Login
        builder.addCase(getMe.pending, (state) => {
            state.isLoading = true;
        });
        builder.addCase(getMe.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isSuccess = true;
            state.karyawan = action.payload;
        });
        builder.addCase(getMe.rejected, (state, action) => {
            state.isLoading = false;
            state.isError = true;
            state.message = action.payload;
        });
    }
})

export const { reset } = authSlice.actions;
export default authSlice.reducer;
