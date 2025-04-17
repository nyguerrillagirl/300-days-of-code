#include <iostream>
#include "SDL.h"

using namespace std;

int main(int argc, char** argv)
{
    if (SDL_Init(SDL_INIT_EVERYTHING) == 0) {
        cout << "SDL_Init worked!" << endl;
    }
    SDL_Quit(); // clean up resources
    return 0;
}
