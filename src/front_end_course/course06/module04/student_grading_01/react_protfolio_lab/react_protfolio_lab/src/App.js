import { ChakraProvider } from "@chakra-ui/react";
import Header from "./components/Header";
import LandingSection from "./components/LandingSection";
import ProjectsSection from "./components/ProjectsSection";
import ContactMeSection from "./components/ContactMeSection";
import Footer from "./components/Footer";
import { AlertProvider } from "./context/alertContext";
import Alert from "./components/Alert";
import React, { useEffect, useRef } from 'react';


function App() {
  const boxRef = useRef(null);
  const lastScrollY = useRef(0);
    useEffect(() => {
    const handleScroll = () => {
      const currentScrollY = window.scrollY;
      if (!boxRef.current) return;

      if (currentScrollY > lastScrollY.current) {
        // Scrolling down - hide header
        boxRef.current.style.transform = 'translateY(-200px)';
      } else {
        // Scrolling up - show header
        boxRef.current.style.transform = 'translateY(0)';
      }

      lastScrollY.current = currentScrollY;
    };

    window.addEventListener('scroll', handleScroll);

    // Cleanup listener on unmount
    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []);
  return (
    
    <ChakraProvider >
      <AlertProvider>
       
        <main>
            <div
      ref={boxRef}
       style={{
       
        top: 0,
        left: 0,
        right: 0,
        height: '60px',
        backgroundColor: 'teal',
        transition: 'transform 0.3s ease',
        transform: 'translateY(0)', // initial visible position
        zIndex: 1000,
      }}
    >
          <Header />
          <LandingSection />
          <ProjectsSection />
          <ContactMeSection />
          <Footer />
          <Alert />
           </div>
        </main>
        
      </AlertProvider>
    </ChakraProvider>
   
  );
}

export default App;
