#include "TileLayer.h"

TileLayer::TileLayer(int tilesize, int width, int rowcount, TileMap tilemap, TilesetsList tilesets):
    m_TileSize(tilesize),
    m_Width(width),
    m_Height(rowcount),
    m_Tilemap(tilemap),
    m_Tilesets(tilesets)
{}


void TileLayer::Render()
{

}

void TileLayer::Update()
{

}


