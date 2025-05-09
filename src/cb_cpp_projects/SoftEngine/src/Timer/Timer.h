#ifndef TIMER_H
#define TIMER_H

// This represents a screen getting updated every 16.6 milliseconds (1000 milliseconds/60)
const int TARGET_FPS = 60;

// Makes sure we never go over faster than 16.6 milliseconds * 1.5
const float TARGET_DELTATIME = 1.5f;

class Timer
{
    public:
        inline static Timer* GetInstance() { return s_Instance = (s_Instance != nullptr) ? s_Instance : new Timer();}

        void Tick();
        inline float GetDeltaTime() { return m_DeltaTime; }


    private:
        Timer() {};
        static Timer* s_Instance;
        float m_DeltaTime;  // The difference between now and last time of a tick
        float m_LastTime;   // holds the last time we recorded a tick()
};

#endif // TIMER_H
