import React from 'react';
import { useTheme } from '../context/ThemeProvider';

const ThemedComponent = () => {
    const { theme, toggleTheme } = useTheme();

    return (
        <div style={{ background: theme === 'light' ? '#fff' : '#333', color: theme === 'light' ? '#333' : '#fff' }}>
          <h2>Themed Component</h2>
          <p>Current Theme: {theme}</p>
          <button onClick={toggleTheme}>Toggle Theme</button>
        </div>
      );
    
}

export default ThemedComponent;