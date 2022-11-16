//game state
enum GameScreen {  
  EMPTY, TITLE, WORLD, DORMS, LIBRARY, COMMONS, RESULTS;
}

// game globals
GameScreen g_state;
PImage screen;

PFont font;

// button globals
float fRectx, fRecty, fRectSOne, fRectSTwo; 
float sRectx, sRecty;

int selection = 1; // keeps track of variable

boolean isTitle = true; 
boolean disableGUI = false;
