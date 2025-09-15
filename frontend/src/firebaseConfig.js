// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDHIVT4Y0y6DmSfwpNwq4G1TLjwtKXQotM",
  authDomain: "stacja-pogodowa-c4fdb.firebaseapp.com",
  databaseURL: "https://stacja-pogodowa-c4fdb-default-rtdb.europe-west1.firebasedatabase.app",
  projectId: "stacja-pogodowa-c4fdb",
  storageBucket: "stacja-pogodowa-c4fdb.firebasestorage.app",
  messagingSenderId: "376953193376",
  appId: "1:376953193376:web:e86682fd0b850d259adac5",
  measurementId: "G-5DP0Z9V4NT"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);