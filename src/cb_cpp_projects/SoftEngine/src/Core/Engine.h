#ifndef ENGINE_H
#define ENGINE_H


class Engine
{
    public:
        static Engine* GetInstance() {
            return s_Instance = (s_Instance != nullptr) ? s_Instance : new Engine();
        }

        bool Init();
        bool Clean();
        void Quit();

        void Update();
        void Render();
        void Events();

        inline bool isRunning() {
            return m_IsRunning;
        }

    protected:

    private:
        Engine() {}
        static Engine* s_Instance;
        bool m_IsRunning;

};

#endif // ENGINE_H
