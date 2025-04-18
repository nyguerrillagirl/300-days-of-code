#include "Engine.h"
#include <iostream>

Engine* Engine::s_Instance = nullptr;

bool Engine::Init()
{
    std::cout << "Initializing..." << std::endl;
    m_IsRunning = true;
    //return true;
}

bool Engine::Clean()
{
    std::cout << "Clean..." << std::endl;
    return true;
}

void Engine::Quit()
{

}

void Engine::Update()
{
    std::cout << "Updating..." << std::endl;
}

void Engine::Render()
{
    std::cout << "Render..." << std::endl;
}

void Engine::Events()
{
    std::cout << "Events..." << std::endl;
}
