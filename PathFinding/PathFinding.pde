NodeMap worldMap;

int deltaTime = 0;
int previousTime = 0;

int mapRows = 100;
int mapCols = 100;

color baseColor = color (0, 127, 0);

void setup () {
  //size (420, 420);
  fullScreen();
  
  initMap();
}

void draw () {
  deltaTime = millis () - previousTime;
  previousTime = millis();
  
  update(deltaTime);
  display();
}

void update (float delta) {
  
}

void display () {
  
  if (worldMap.path != null) {
    for (Cell c : worldMap.path) {
      c.setFillColor(color (127, 0, 0));
    }
  }
  
  worldMap.display();
}

void initMap () {
  worldMap = new NodeMap (mapRows, mapCols); 
  
  worldMap.setBaseColor(baseColor);
  
  worldMap.setStartCell(mapCols / 2 - 5, 3);
  worldMap.setEndCell(mapCols - 1, mapRows - 1);
  
  worldMap.updateHs();
  
  worldMap.makeWall (mapCols / 2, 0, 15, true);
  worldMap.makeWall (mapCols / 2 - 9, 10, 10, false);
    
  worldMap.generateNeighbourhood(); //<>//
      
  worldMap.findAStarPath();
}
