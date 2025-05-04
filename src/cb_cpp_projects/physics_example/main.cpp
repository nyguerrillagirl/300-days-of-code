#include <SDL.h>
#include <iostream>

// Screen dimensions
const int SCREEN_WIDTH = 800;
const int SCREEN_HEIGHT = 600;

// Gravity constant
const float GRAVITY = 0.2f;

// Player structure with physics properties
struct Player {
    SDL_Rect rect;  // Position and size
    float velocityY;  // Vertical velocity
    float velocityX; // add - figgy
    bool isOnGround; // Ground check

    Player(int x, int y, int w, int h) {
        rect = { x, y, w, h };
        velocityY = 0.0f;
        velocityX = 0.0f;
        isOnGround = false;
    }

    void applyGravity() {
        if (!isOnGround) {
            velocityY += GRAVITY;
        }
    }

    void jump() {
        if (isOnGround) {
            velocityY = -12.0f; // Jump force
            velocityX = 1.0f;
            isOnGround = false;
        }
    }

    void update() {
        applyGravity();
        rect.y += static_cast<int>(velocityY);
        rect.x += static_cast<int>(velocityX);
        // Simulate ground collision (simple floor check)
        if (rect.y + rect.h >= SCREEN_HEIGHT) {
            rect.y = SCREEN_HEIGHT - rect.h;
            velocityY = 0;
            velocityX = 0;
            isOnGround = true;
        }
        if (rect.x + rect.w >= SCREEN_WIDTH) {
            rect.x = SCREEN_WIDTH - rect.w;
             velocityX = 0;
        }
    }
};

// Main SDL application loop
int main(int argc, char* argv[]) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        std::cerr << "SDL Initialization Failed: " << SDL_GetError() << std::endl;
        return -1;
    }

    SDL_Window* window = SDL_CreateWindow("2D Platformer Physics",
                                          SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                                          SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);

    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

    Player player(50, 50, 50, 50); // Initialize player position

    bool running = true;
    SDL_Event event;

    while (running) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = false;
            }
            if (event.type == SDL_KEYDOWN) {
                if (event.key.keysym.sym == SDLK_SPACE) {
                    player.jump();  // Jump when Space is pressed
                }
            }
        }

        player.update(); // Update physics

        // Rendering
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255); // Clear screen (black)
        SDL_RenderClear(renderer);

        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255); // Draw player (white)
        SDL_RenderFillRect(renderer, &player.rect);

        SDL_RenderPresent(renderer); // Display frame

        SDL_Delay(16); // Simulate ~60 FPS
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
