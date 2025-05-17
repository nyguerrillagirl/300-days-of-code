#include "MapParser.h"

MapParser* MapParser::s_Instance = nullptr;

bool MapParser::Load()
{
    return Parse("MAP", "assets/maps/map1.tmx");

}


bool MapParser::Parse(std::string id, std::string source)
{
    TiXmlDocument xml;

    // Read in the *.tmx file
    xml.LoadFile(source);

    // Check if all went well
    if (xml.Error()) {
        std::cerr << "Failed to load: " << source << std::endl;
        return false;
    }

    // get the root element <map>
    TiXmlElement* root = xml.RootElement();
    int rowcount, colcount, tilesize = 0;    // extract these attributes from <map>

    root->Attribute("width", &colcount);
    root->Attribute("height", &rowcount);
    root->Attribute("tilewidth", &tilesize); // This assumes all tiles are N x N

    // Iterate through all the <tileset> elements
    TilesetsList tilesets;
    for(TiXmlElement* e = root->FirstChildElement(); e != nullptr; e = e->NextSiblingElement()) {
        if (e->Value() == std::string("tileset")) {
            tilesets.push_back(ParseTileset(e));
        }
    }

    // Populate with Game Map layers
    GameMap* gamemap = new GameMap();

    // iterate through all the <layer> elements
    for(TiXmlElement* e=root->FirstChildElement(); e!= nullptr; e=e->NextSiblingElement()){
        if(e->Value() == std::string("layer")){
            TileLayer* tilelayer = ParseTileLayer(e, tilesets, tilesize, rowcount, colcount);
            gamemap->m_MapLayers.push_back(tilelayer);
        }
    }

    m_MapDictionary[id] = gamemap;

    return true;

}


/*  Processes something like:
    <tileset firstgid="1" name="Jungle_terrain" tilewidth="32" tileheight="32" tilecount="420" columns="28">
        <image source="Jungle_terrain.png" width="896" height="480"/>
    </tileset>
*/
Tileset MapParser::ParseTileset(TiXmlElement* xmlTileset)
{
    Tileset tileset;    // We will extract one tileset from the parser

    // Extract the name (string value)
    tileset.Name = xmlTileset->Attribute("name");

    // Extract the firstgid (int value)
    xmlTileset->Attribute("firstgid", &tileset.FirstID);

    xmlTileset->Attribute("tilecount", &tileset.TileCount);

    // Calculate the LastID (makes sense if there is more than one tileset...
    tileset.LastID = (tileset.FirstID + tileset.TileCount) - 1;

    // Extract the number of columns in the tileset
    xmlTileset->Attribute("columns", &tileset.Width);

    // Calculate the height or rows of tiles
    tileset.Height = tileset.TileCount / tileset.Width;


    xmlTileset->Attribute("tilewidth", &tileset.TileSize);

    // Extract the first/only child element under <tileset>
    TiXmlElement* image = xmlTileset->FirstChildElement();
    tileset.Source = image->Attribute("source");

    return tileset;
}

/* This method parses the <layer> section of the tmx file
    <layer id="2" name="B2" width="60" height="20">
      <properties>
        <property> ... </property>
            :
            :
        <property> ... </property>
      </properties>
      <data encoding="csv">
            :
            :
      </data>
    </layer>
*/
TileLayer* MapParser::ParseTileLayer(TiXmlElement* xmlLayer, TilesetsList tilesets, int tilesize, int rowcount, int colcount)
{
    // Holds the <data> part of the <layer>
    TiXmlElement* data;

    // Need to find the child element that is a <data>, so we iterate through the children
    for(TiXmlElement* e=xmlLayer->FirstChildElement(); e!= nullptr; e=e->NextSiblingElement()) {
        if(e->Value() == std::string("data")) {
            data = e;
            break;
        }
    }

    // Parse Layer tile map
    std::string matrix(data->GetText());    // just a string
    std::istringstream iss(matrix);
    std::string id;

    // convert or transform the string of data into a 2D matrix
    TileMap tilemap(rowcount, std::vector<int> (colcount, 0));  // this is our 2D array holding the game map tile IDs
    for(int row = 0; row < rowcount; row++) {
        for (int col = 0; col < colcount; col++) {
            getline(iss, id, ',');
            std::stringstream convertor(id);
            convertor >> tilemap[row][col];

            if(!iss.good())
                break;
        }
    }

    return (new TileLayer(tilesize, colcount, rowcount, tilemap, tilesets));
}


void MapParser::Clean()
{
    std::map<std::string, GameMap*>::iterator it;
    for(it = m_MapDictionary.begin(); it != m_MapDictionary.end(); it++) {
        it->second = nullptr;
    }

    m_MapDictionary.clear();
}

