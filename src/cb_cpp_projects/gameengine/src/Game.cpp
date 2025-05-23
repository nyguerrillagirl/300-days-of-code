#include "Game.h"
#include <iostream>

Game::Game() {
    isRunning = false;
    std::cout << "Game constructor called." << std::endl;
}

Game::~Game() {
    std::cout << "Game destructor called." << std::endl;
}

void Game::Initialize() {
    if (SDL_Init(SDL_INIT_EVERYTHING) != 0) {
        std::cerr << "Error initializing SDL." << std::endl;
        return;
    }

    // Obtain monitor window dimentions
    SDL_DisplayMode displayMode;
    SDL_GetCurrentDisplayMode(0, &displayMode);

    windowWidth = 800; //displayMode.w;
    windowHeight = 600; //displayMode.h;

    window = SDL_CreateWindow(
        NULL,   // No title
        SDL_WINDOWPOS_CENTERED, // centered on screen in x direction
        SDL_WINDOWPOS_CENTERED, // centered on screen in y direction
        windowWidth,
        windowHeight,
        SDL_WINDOW_BORDERLESS
        );

    if (!window) {
        std::cerr << "Error creating SDL window." << std::endl;
        return;
    }

    renderer = SDL_CreateRenderer(window, -1, 0);
    if (!renderer) {
        std::cerr << "Error creating SDL renderer." << std::endl;
        return;
    }

    //SDL_SetWindowFullscreen(window, SDL_WINDOW_FULLSCREEN); // changes the video mode to real fullscreen
    // Let's go ahead and start the game!
    isRunning = true;
}


void Game::Run() {
    while(isRunning) {
        ProcessInput();
        Update();
        Render();
    }
}

void Game::ProcessInput() {
    SDL_Event sdlEvent;
    while (SDL_PollEvent(&sdlEvent)) {
        switch (sdlEvent.type) {
            case SDL_QUIT:      // event: user closed our SDL window
                isRunning = false;
                break;
            case SDL_KEYDOWN:
                if (sdlEvent.key.keysym.sym == SDLK_ESCAPE) {
                    isRunning = false;
                }
                break;
        }
    }

}


void Game::Update() {
    // TODO: update game object...
}

void Game::Render() {
    // Paint the entire window with a solid color
    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
    SDL_RenderClear(renderer);

    // TODO: Render all game objects...

    SDL_RenderPresent(renderer);
}

void Game::Destroy() {
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

