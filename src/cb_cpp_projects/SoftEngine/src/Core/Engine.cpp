#include "Engine.h"
#include "TextureManager.h"
#include "Transform.h"
#include "Warrior.h"
#include <iostream>

Engine* Engine::s_Instance = nullptr;
Warrior* player = nullptr;

bool Engine::Init()
{
     if (SDL_Init(SDL_INIT_VIDEO) != 0 && IMG_Init(IMG_INIT_JPG | IMG_INIT_PNG) != 0) {
        SDL_Log("Failed to initialize SDL: %s", SDL_GetError());
        return false;
    }

    // Create our SDL window
    m_Window = SDL_CreateWindow("Soft Engine", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, SCREEN_WIDTH, SCREEN_HEIGHT, 0);
    if (m_Window == nullptr) {
         SDL_Log("Failed to create window: %s", SDL_GetError());
        return false;
    }

    m_Renderer = SDL_CreateRenderer(m_Window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
        if (m_Renderer == nullptr) {
         SDL_Log("Failed to create Renderer: %s", SDL_GetError());
        return false;
    }

    TextureManager::GetInstance()->Load("player", "assets/Idle.png");
    player = new Warrior(new Properties("player", 100, 200, 136, 96));

    Transform tf;
    tf.Log();

    return m_IsRunning = true;
}

bool Engine::Clean()
{
    TextureManager::GetInstance()->Clean();

    if (m_Renderer != nullptr) {
        SDL_DestroyRenderer(m_Renderer);
    }
    if (m_Window != nullptr) {
        SDL_DestroyWindow(m_Window);
    }
    IMG_Quit();
    SDL_Quit();
    return true;
}

void Engine::Quit()
{
    m_IsRunning = false;
}

void Engine::Update()
{
    player->Update(0);
}

void Engine::Render()
{
    // Set the draw color
    SDL_SetRenderDrawColor(m_Renderer, 124, 218, 254, 255);

    // Clear the screen with the draw color
    SDL_RenderClear(m_Renderer);

    //TextureManager::GetInstance()->Draw("tree", 100, 100, 347, 465);

    // Draw our Warrior
    player->Draw();

    // Present the renderer (update the window)
    SDL_RenderPresent(m_Renderer);
}

void Engine::Events()
{
    SDL_Event event;
    SDL_PollEvent(&event);
    switch(event.type) {
    case SDL_QUIT:
        Quit();
        break;
    }
}
