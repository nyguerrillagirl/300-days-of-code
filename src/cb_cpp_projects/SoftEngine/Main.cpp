#include "Engine.h"
#include <iostream>

int main(int argc, char** argv)
{
    if (!Engine::GetInstance()->Init()) {
        std::cout << "Initialization of Engine failed." << std::endl;
    }


    while (Engine::GetInstance()->isRunning()) {
        // Get all current events (e.g. mouse clicks, etc.)
        Engine::GetInstance()->Events();

        // Update all objects/entities
        Engine::GetInstance()->Update();

        // Render/update the game graphics
        Engine::GetInstance()->Render();
    }

    // Clean everything up
    Engine::GetInstance()->Clean();

    return 0;
}
