import React, { useEffect, useState } from 'react';
import api from './api';

function App() {
  const [data, setData] = useState(null);

  useEffect(() => {
    api.get('/api/data')
      .then(response => setData(response.data))
      .catch(error => console.error('Błąd połączenia z API:', error));
  }, []);

  return (
    <div>
      <h1>Dane z Symfony API</h1>
      {data ? (
        <pre>{JSON.stringify(data, null, 2)}</pre>
      ) : (
        <p>Ładowanie danych...</p>
      )}
    </div>
  );
}

export default App;
