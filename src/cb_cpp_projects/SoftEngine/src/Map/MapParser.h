#ifndef MAPPARSER_H
#define MAPPARSER_H

#include <map>
#include <string>
#include "GameMap.h"
#include "TileLayer.h"
#include "tinyxml.h"

class MapParser
{
    public:
        // Returns true if the map was successfully loaded, otherwise false
        bool Load();

        // Cleans the map
        void Clean();

        inline GameMap* GetMap(std::string id) { return m_MapDictionary[id];};

        // Returns the current instance of the MapParser
        inline static MapParser* GetInstance() {
            return s_Instance = (s_Instance != nullptr ? s_Instance : new MapParser());
        }

    private:
        bool Parse(std::string id, std::string source);
        Tileset ParseTileset(TiXmlElement* xmlTileset);
        TileLayer* ParseTileLayer(TiXmlElement* xmlLayer, TilesetsList tilesets, int tilesize, int rowcount, int colcount);

    private:
        MapParser() {};
        static MapParser* s_Instance;
        std::map<std::string, GameMap*> m_MapDictionary;
};

#endif // MAPPARSER_H
