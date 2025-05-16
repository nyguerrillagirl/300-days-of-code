#ifndef GAME_H
#define GAME_H

#include <SDL.h>

class Game {
    public:
        Game();
        ~Game();

        void Initialize();
        void Run();

        void ProcessInput();
        void Update();
        void Render();

        void Destroy();

        int windowWidth;
        int windowHeight;

    private:
        SDL_Window* window;
        SDL_Renderer* renderer;
        bool isRunning;
};

#endif // GAME_H
