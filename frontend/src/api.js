import axios from 'axios';

const api = axios.create({
  baseURL: 'https://twoj-backend-hosting.com/api', // zmień na adres backendu
});

export default api;
