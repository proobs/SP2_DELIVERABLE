// File: main.pde
// Author: TEAM 2 / TEAM GOAT: Chiji, Mahad, Isaiah, Alexus, Camron
// Date: 11/17/2022
// Class: COMP 101
// Description: Main file, hosts entire semester project

void setup(){
  size(1000, 1000);
  
  guiSetup(); 
   // set gamestate
  g_state = GameScreen.EMPTY; 
}

void draw() {
  background(0);
  
  font = createFont("assests/PixeloidMono.ttf", width/11.1);
  
  // GUI (see buttons.pde) 
  guiManager(); 
 
 // character
 drawCharacter(); 
 
 // screen select
 gameManager();
 
 // font size for text
 textSize = height / 14.28;
}


void mousePressed() { 
  // check if button has been clicked
  buttonCheck(); 
  
  // check for week one mouse activation
  mouseClickGS(); 

}

//keyPress - check for key presses
void keyPressed(){
  // if mathGame is true, allow for numcheck to run
  if(mathGame) {
    numCheck();
  }
}

// print message 
void printMSG(String a, int x, int y, float fontSize) {
  fill(255);
  font = createFont("assests/PixeloidMono.ttf", fontSize);
  textFont(font);
  text(a, x, y); 
}
