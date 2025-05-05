#ifndef TRANSFORM_H
#define TRANSFORM_H

#include "Vector2D.h"

class Transform
{
    public:
        float X, Y;

    public:
        Transform(float x=0, float y=0):X(x), Y(y) {}

        void Log(std::string msg="") {
            std::cout << msg << "(X,Y)= (" << X << " " << Y << ")" << std::endl;
       }

    public:
        // Move in the X-axis direction
        inline void TranslateX(float x) { X += x; }

        // Move in the Y-axis direction
        inline void TranslateY(float y) { Y += y; }

        // Move in the game world using a vector
        inline void Translate(Vector2D v) { X += v.X; Y += v.Y; }
};

#endif // TRANSFORM_H
