import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import { ChakraProvider, extendTheme } from '@chakra-ui/react'

// extend the theme
const colors = {
  brand: {
    500: '#4287f5',
    600: '#337df2',
    700: '#2977f2',
    800: '#146af5',
    900: '#024fc9'
  }
}

const fonts = {
  heading: 'Courier New',
  body: 'Tahoma'
}
const theme = extendTheme({colors, fonts});


ReactDOM.createRoot(document.getElementById('root')).render(
 
     <React.StrictMode>
      <ChakraProvider theme={theme}>
        <App />
      </ChakraProvider>
    </React.StrictMode>
 
)