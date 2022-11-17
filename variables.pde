// File: main.pde
// Author: TEAM 2 / TEAM GOAT: Chiji, Mahad, Isaiah, Alexus, Camron
// Date: 11/17/2022
// Class: COMP 101
// Description: Variables, hosts entire semester project variables

//game state
enum GameScreen {  
  EMPTY, TITLE, WORLD, DORMS, LIBRARY, COMMONS, RESULTS;
}

// game globals
GameScreen g_state;
PImage screen;

PFont font;
float textSize;

// button globals
float fRectx, fRecty, fRectSOne, fRectSTwo; 
float sRectx, sRecty;
boolean disableNext = false;

int selection = 1; // keeps track of variable

boolean isTitle = true; 
boolean disableGUI = false;

int countPlaces = 3; // places to go 

String text1 = "next", text2 = "go", text3 = "back";

// math game vaariables
int mathAns; 
boolean mathGame = true;
int num= 0;
String str_num = "";
boolean studentPassed; 
