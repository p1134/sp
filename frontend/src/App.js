import React, { useEffect, useState } from 'react';
import api from './api';

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    api.get('/endpoint')
      .then(response => setData(response.data))
      .catch(error => console.error(error));
  }, []);

  return (
    <div>
      <h1>Dane z Symfony API</h1>
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  );
}

export default App;
