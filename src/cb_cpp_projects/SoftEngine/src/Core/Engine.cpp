#include "Engine.h"
#include "TextureManager.h"
#include "Transform.h"
#include "Warrior.h"
#include "Input.h"
#include "Timer.h"
#include "MapParser.h"
#include "Camera.h"
s
#include <iostream>

Engine* Engine::s_Instance = nullptr;
Warrior* player = nullptr;

bool Engine::Init()
{
     if (SDL_Init(SDL_INIT_VIDEO) != 0 && IMG_Init(IMG_INIT_JPG | IMG_INIT_PNG) != 0) {
        SDL_Log("Failed to initialize SDL: %s", SDL_GetError());
        return false;
    }

    // Populate with window flags
    SDL_WindowFlags window_flags = (SDL_WindowFlags) (SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI);

    // Create our SDL window
    m_Window = SDL_CreateWindow("Soft Engine", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, SCREEN_WIDTH, SCREEN_HEIGHT, window_flags);
    if (m_Window == nullptr) {
         SDL_Log("Failed to create window: %s", SDL_GetError());
        return false;
    }

    m_Renderer = SDL_CreateRenderer(m_Window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
        if (m_Renderer == nullptr) {
         SDL_Log("Failed to create Renderer: %s", SDL_GetError());
        return false;
    }

    if (!MapParser::GetInstance()->Load()) {
        std::cout << "Failed to load map" << std::endl;
        return false;
    }
    // Get our game map
    m_LevelMap = MapParser::GetInstance()->GetMap("MAP");

    // Load sprite sheet of the playing in idle state
    TextureManager::GetInstance()->Load("player", "assets/Idle.png");

    // Load sprite sheet of the player running
    TextureManager::GetInstance()->Load("player_run", "assets/Run.png");

    // Load a background image
    TextureManager::GetInstance()->Load("bg", "assets/images/bg.png");

    // Set the player's initial position on the screen and the size of each frame
    player = new Warrior(new Properties("player", 100, 200, 136, 96));

    Camera::GetInstance()->SetTarget(player->GetOrigin());


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
    float dt = Timer::GetInstance()->GetDeltaTime();
    m_LevelMap->Update();
    player->Update(dt);
    Camera::GetInstance()->Update(dt);
}

void Engine::Render()
{
    // Set the draw color
    SDL_SetRenderDrawColor(m_Renderer, 124, 218, 254, 255);

    // Clear the screen with the draw color
    SDL_RenderClear(m_Renderer);

    // Draw our background
    TextureManager::GetInstance()->Draw("bg", 0, 0, 2100, 1050);
    // Draw our map
    m_LevelMap->Render();

    // Draw our Warrior
    player->Draw();

    // Present the renderer (update the window)
    SDL_RenderPresent(m_Renderer);
}

void Engine::Events()
{
    Input::GetInstance()->Listen();
}
