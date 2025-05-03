#ifndef ANIMATION_H
#define ANIMATION_H

#include <string>
#include "SDL.h"

class Animation
{
    public:
        Animation() {};

        void Update();
        void Draw(float x, float y, int spriteWidth, int spriteHeight);
        void SetProps(std::string textureID, int spriteRow, int frameCount, int animSpeed, SDL_RendererFlip flip=SDL_FLIP_NONE);

    private:
        int m_SpriteRow;            // holds the sprite sheet row we are processing
        int m_SpriteFrame;          // holds the sprite or frame in the row we will draw next
        int m_AnimSpeed;            // holds the number of milliseconds we will display a frame
        int m_FrameCount;           // holds the total number of frames per row
        std::string m_TextureID;    // holds the sprite sheet texture/image ID
        SDL_RendererFlip m_Flip;    // holds the orientation of the image to display
};

#endif // ANIMATION_H
