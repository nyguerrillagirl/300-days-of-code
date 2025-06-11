import { createSystem, defaultConfig } from "@chakra-ui/react";

export const system = createSystem(defaultConfig, {
  theme: {
    tokens: {
      colors: {
        primary: { value: "#4299E1" },
        secondary: { value: "#9F7AEA" },
        accent: { value: "#38B2AC" },
        background: { value: "#1A202C" },
        text: { value: "#2D3748" },
        action: { value: "#ED8936" }, // Chakra's Orange.500 for buttons
      },
      fonts: {
        heading: { value: "'Poppins', sans-serif" },
        body: { value: "'Inter', sans-serif" },
      },
    },
  },
});

export default system;