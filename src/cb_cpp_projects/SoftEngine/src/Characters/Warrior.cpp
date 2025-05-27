#include "Warrior.h"
#include "SDL.h"
#include "TextureManager.h"
#include "Input.h"
#include "Camera.h"
#include "Engine.h"
#include "CollisionHandler.h"

Warrior::Warrior(Properties* props): Character(props) {
    m_JumpTime = JUMP_TIME;
    m_JumpForce = JUMP_FORCE;

    m_Collider = new Collider();
    // no difference between SDL_Rect defining player and it's collider
    m_Collider->SetBuffer(0,0,0,0);

    m_RigidBody = new RigidBody();
    m_RigidBody->SetGravity(3.0f);  // Set the natural pull of gravity

    m_Animation = new Animation();
    m_Animation->SetProps(m_TextureID, 0, 8, 100);
}

void Warrior::Draw() {
    // Move and Draw our Warrior
    m_Animation->Draw(m_Transform->X, m_Transform->Y, m_Width, m_Height);

    // Create an artificial box around our Warrior (temporary)
    Vector2D cam = Camera::GetInstance()->GetPosition();
    SDL_Rect box = m_Collider->Get();   // get the Warrior's collider box

    // Make sure the collider box is adjusted to follow the Warrior
    box.x -= cam.X;
    box.y -= cam.Y;
    SDL_RenderDrawRect(Engine::GetInstance()->GetRenderer(), &box);
}

void Warrior::Update(float dt) {
    // Default to player being idle
    m_Animation->SetProps("player", 0, 6, 100);
    // Unset any and all forces by default
    m_RigidBody->UnSetForce();

    if (Input::GetInstance()->GetKeyDown(SDL_SCANCODE_A)) {
        // player is moving left/backwards
        m_RigidBody->ApplyForceX(5*BACKWARD);
        // need to reset the animation to player_run and flip on horizontal
        m_Animation->SetProps("player_run", 0, 8, 100, SDL_FLIP_HORIZONTAL);
    }

    if (Input::GetInstance()->GetKeyDown(SDL_SCANCODE_D)) {
        // player is moving right/forwards
        m_RigidBody->ApplyForceX(5*FORWARD);
        // need to reset the animation to player_run
        m_Animation->SetProps("player_run", 0, 8, 100);
    }

    // Check if "Jump" key pressed AND player can jump
    if(Input::GetInstance()->GetKeyDown(SDL_SCANCODE_J) && m_IsGrounded) {
        m_IsJumping = true;
        m_IsGrounded = false;
        m_RigidBody->ApplyForceY(UPWARD * m_JumpForce);
    }

    // Check if "Jump" key pressed while playing is already jumping
    if(Input::GetInstance()->GetKeyDown(SDL_SCANCODE_J) && m_IsJumping && m_JumpTime > 0) {
        m_JumpTime -= dt;   // decrease the time where the player can jump up higher
        m_RigidBody->ApplyForceY(UPWARD * m_JumpForce);
    } else {
        m_IsJumping = false;
        m_JumpTime = JUMP_TIME;
    }

    m_RigidBody->Update(dt);
    // Remember the last "safe" position for X before we move
    m_LastSafePosition.X = m_Transform->X;

    // move on the X-axis
    m_Transform->X += m_RigidBody->Position().X;
    m_Collider->Set(m_Transform->X, m_Transform->Y, 96, 96);

    // If collided with any map collision object - go back to the last X spot
    if (CollisionHandler::GetInstance()->MapCollision(m_Collider->Get())) {
        m_Transform->X = m_LastSafePosition.X;
    }

    // move on Y axis
    m_RigidBody->Update(dt);
    m_LastSafePosition.Y = m_Transform->Y;

    m_Transform->Y += m_RigidBody->Position().Y;
    m_Collider->Set(m_Transform->X, m_Transform->Y, 96, 96);

    // If collided with any map collision object - go back to the last Y spot
    if (CollisionHandler::GetInstance()->MapCollision(m_Collider->Get())) {
        m_IsGrounded = true;
        m_Transform->Y = m_LastSafePosition.Y;
    } else {
        m_IsGrounded = false;
    }

    // Update the Origin
    m_Origin->X = m_Transform->X + m_Width / 2;
    m_Origin->Y = m_Transform->Y + m_Height / 2;

    m_Animation->Update();
}

void Warrior::Clean() {
    TextureManager::GetInstance()->Drop(m_TextureID);
}
