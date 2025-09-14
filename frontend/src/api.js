import axios from 'axios';

const api = axios.create({
  baseURL: 'https://sp-djc0.onrender.com/api', // zmień na adres backendu
});

export default api;
