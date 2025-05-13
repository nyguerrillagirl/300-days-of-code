#include <iostream>
#include <SDL.h>
#include <SDL_image.h>
#include <SDL_ttf.h>
#include <SDL_mixer.h>
#include <glm/glm.hpp>
#include <imgui/imgui.h>
#include <sol/sol.hpp>

int main(int argc, char* argv[]) {

    sol::state lua;
    lua.open_libraries(sol::lib::base);

    glm::vec2 velocity = glm::vec2(2.0, -1.0);

    if (SDL_Init(SDL_INIT_EVERYTHING) == 0) {
        std::cout << "SDL_Init worked!" << std::endl;
    }
    // Initialize SDL2_ttf
    TTF_Init();
    if (Mix_OpenAudio(220050, MIX_DEFAULT_FORMAT, 2, 4096) == -1) {
        std::cout << "SDL_mixer could not be initialized" << std::endl
            << "SDL_Error: " << SDL_GetError() << std::endl;
    }

    std::cout << "Yeah! Dependencies are working correctly!" << std::endl;
    Mix_CloseAudio();
    TTF_Quit();
    SDL_Quit(); // clean up resources

    return 0;
}
