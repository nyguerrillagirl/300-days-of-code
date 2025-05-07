#ifndef INPUT_H
#define INPUT_H

#include "SDL.h"

class Input
{
    public:
        // Only ever have one instance of Input in our program
        static Input* GetInstance() {
            return s_Instance = (s_Instance != nullptr) ? s_Instance : new Input();
        }

        void Listen();

        // Used to let the client know if a specific key has been pressed
        bool GetKeyDown(SDL_Scancode key);

    private:
      Input();
      void KeyUp();
      void KeyDown();

      // An array that tracks all the keys that are currently being pushed
      const Uint8* m_KeyStates;
      static Input* s_Instance;
};

#endif // INPUT_H
