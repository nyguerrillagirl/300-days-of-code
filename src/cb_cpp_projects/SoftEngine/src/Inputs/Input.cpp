#include "Input.h"
#include "Engine.h"

Input* Input::s_Instance = nullptr;

Input::Input()
{
    // Obtain the initial state of the keyboard
    m_KeyStates = SDL_GetKeyboardState(nullptr);
}

void Input::Listen()
{
    SDL_Event event;

    while(SDL_PollEvent(&event)) {
        switch(event.type) {
            case SDL_QUIT:
                // User requested application close
                Engine::GetInstance()->Quit();
                break;
            case SDL_KEYDOWN:
                KeyDown();
                break;
            case SDL_KEYUP:
                KeyUp();
                break;
            default:
                break;
        }
    }
}

bool Input::GetKeyDown(SDL_Scancode key)
{
    if (m_KeyStates[key] == 1) {
        return true;
    } else {
        return false;
    }
}

void Input::KeyUp()
{
    // Update our keyboard array
    m_KeyStates = SDL_GetKeyboardState(nullptr);
}

void Input::KeyDown()
{
    // Update the keyboard array
    m_KeyStates = SDL_GetKeyboardState(nullptr);
}
