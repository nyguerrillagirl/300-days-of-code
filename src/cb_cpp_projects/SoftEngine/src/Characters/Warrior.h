#ifndef WARRIOR_H
#define WARRIOR_H

#include "Character.h"
#include "Animation.h"
#include "RigidBody.h"
#include "Collider.h"
#include "Vector2D.h"

#define JUMP_TIME 15.0f
#define JUMP_FORCE 10.0f

class Warrior : public Character
{
    public:
        Warrior(Properties* props);

        virtual void Draw();
        virtual void Update(float dt);
        virtual void Clean();


    private:
        bool m_IsJumping;   // indicates the player is jumping
        bool m_IsGrounded;  // indicates the player is grounded (so player can jump)

        float m_JumpTime;   // ?
        float m_JumpForce;  // the force the player uses to jump up

        Collider* m_Collider;   // defines the collision box around the player
        Animation* m_Animation;
        RigidBody* m_RigidBody;

        // if player collides with something this is the position to restore back to
        Vector2D m_LastSafePosition;
};
#endif // WARRIOR_H
