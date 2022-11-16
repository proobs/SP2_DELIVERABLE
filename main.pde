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
}


void mousePressed() { 
  buttonCheck(); 
  if (g_state == GameScreen.WORLD) {
      g_state = GameScreen.EMPTY; 
      disableGUI = false;
      selection +=1; 
      
  }
}

// print message 
void printMSG(String a, int x, int y, float fontSize) {
  fill(255);
  font = createFont("assests/PixeloidMono.ttf", fontSize);
  textFont(font);
  text(a, x, y); 
}
