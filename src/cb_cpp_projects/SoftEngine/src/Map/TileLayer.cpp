#include "TileLayer.h"
#include "TextureManager.h"

TileLayer::TileLayer(int tilesize, int width, int rowcount, TileMap tilemap, TilesetsList tilesets):
    m_TileSize(tilesize),
    m_Width(width),
    m_Height(rowcount),
    m_Tilemap(tilemap),
    m_Tilesets(tilesets)
{
    // Read in the texture/image of the tileset
    for(int i = 0; i < m_Tilesets.size(); i++) {
        TextureManager::GetInstance()->Load(m_Tilesets[i].Name, "assets/maps/" + m_Tilesets[i].Source);
    }
}


void TileLayer::Render() {

    for(int i=0; i < m_Height; i++) {
         for (int j=0; j < m_Width; j++) {
            // layout a tile
            int tileID = m_Tilemap[i][j];
            if (tileID == 0) {
                continue; // no tile specified
            } else {
                int tileset_index = 0;
                if (m_Tilesets.size() > 1) {
                    for (int k=1; k < m_Tilesets.size(); k++) {
                        if (tileID > m_Tilesets[k].FirstID && tileID < m_Tilesets[k]. LastID) {
                            // This determines the "real" TileID or offset inside the tileset
                            // tileID will be tile offset within tileset (not required for first tileset)
                            tileID = tileID + m_Tilesets[k].TileCount - m_Tilesets[k].LastID;
                            tileset_index = k;
                        }
                    }
                }
                Tileset ts = m_Tilesets[tileset_index];
                int tileRow = (tileID -1 ) / ts.Width;
                int tileCol = tileID - tileRow * ts.Width - 1;

                // fix in case tile is on the last column
                //if (tileID % ts.Width == 0) {
                //    tileRow--;
                //    tileCol = ts.Width - 1
                //}
                // Now draw
                TextureManager::GetInstance()->DrawTile(ts.Name, ts.TileSize, j * ts.TileSize, i * ts.TileSize, tileRow, tileCol);
            }

        }
    }
}

void TileLayer::Update() {

}


