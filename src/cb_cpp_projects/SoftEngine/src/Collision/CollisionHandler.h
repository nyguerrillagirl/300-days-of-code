#ifndef COLLISIONHANDLER_H
#define COLLISIONHANDLER_H

#include "SDL.h"
#include "TileLayer.h"

class CollisionHandler
{
    public:
        inline static CollisionHandler* GetInstance() {
            return s_Instance = (s_Instance != nullptr) ? s_Instance : new CollisionHandler();
        }

        bool CheckCollision(SDL_Rect a, SDL_Rect b);
        bool MapCollision(SDL_Rect a);

    private:
        CollisionHandler();

        TileMap m_CollisionTilemap;
        TileLayer* m_CollisionLayer;

        static CollisionHandler* s_Instance;
};

#endif // COLLISIONHANDLER_H
