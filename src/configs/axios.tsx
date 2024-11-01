import axios from "axios";
import Constants from 'expo-constants';
console.log(Constants.expoConfig?.extra?.apiUrl);

const API_URL = Constants.expoConfig?.extra?.apiUrl || "https://default.api.com";

const axiosInstance = axios.create({
    baseURL: API_URL,
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
    },
});

export default axiosInstance;
