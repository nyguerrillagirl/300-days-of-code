#include "Warrior.h"
#include "SDL.h"
#include "TextureManager.h"
#include "Input.h"

Warrior::Warrior(Properties* props): Character(props)
{
    m_RigidBody = new RigidBody();
    m_Animation = new Animation();
    m_Animation->SetProps(m_TextureID, 0, 8, 100);
}

void Warrior::Draw()
{
    m_Animation->Draw(m_Transform->X, m_Transform->Y, m_Width, m_Height);
}

void Warrior::Update(float dt)
{
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

    m_RigidBody->Update(dt);
    m_Transform->TranslateX(m_RigidBody->Position().X);
    //m_Transform->TranslateY(m_RigidBody->Position().Y);

    // Update the Origin
    m_Origin->X = m_Transform->X + m_Width / 2;
    m_Origin->Y = m_Transform->Y + m_Height / 2;

    m_Animation->Update();
}

void Warrior::Clean()
{
    TextureManager::GetInstance()->Clean();
}
