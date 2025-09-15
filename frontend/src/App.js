import React, { useEffect, useState } from "react";
import api from "./api"; // zakładam, że plik to src/api.js

const WeatherData = () => {
  const [data, setData] = useState(null);

  useEffect(() => {
    api.get("/api/data")
      .then((res) => {
        setData(res.data);
      })
      .catch((err) => {
        console.error("Błąd pobierania danych:", err);
      });
  }, []);

  return (
    <div>
      <h2>Dane pogodowe</h2>
      {data ? (
        <pre>{JSON.stringify(data, null, 2)}</pre>
      ) : (
        <p>Ładowanie danych...</p>
      )}
    </div>
  );
};

export default WeatherData;
