import React from 'react';
import { ThemeProvider } from './context/ThemeProvider';

import ThemedComponent from './components/ThemedComponent';

const App = () => {
  return (
    <ThemeProvider>
      <div>
        <h1>Themed App</h1>
        <ThemedComponent />
      </div>
    </ThemeProvider>
  );
};

export default App;
