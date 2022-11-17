/*
gamestate.pde
Isaiah Turner, Mahad Osman
Desc: game state file
*/

void gameManager(){
   //if the mouse is over the start button and button is pressed, game state is WORLD
  // if game state is WORLD, the image in the center of the screen becomes the campus map
  // etc.....
  if(g_state == GameScreen.TITLE) {
      screen = loadImage("assests/img_titleScreen.png");
      image(screen,0.0,10.0);   
   }
  if(g_state == GameScreen.WORLD) {
      screen = loadImage("assests/img_WorldMap.png");
      // call mini game
      if(selection == 4 && countPlaces !=0) {
        callFirstGameHUD();
      } else {
        disableGUI = false;
        disableNext = false;
        g_state = GameScreen.EMPTY; 
      }
      image(screen, 0, -height/5.9);
   }
   if(g_state == GameScreen.COMMONS) {
      screen = loadImage("assests/img_Commons.png");
      image(screen,0.0, -height/5.9);   
   }
  if(g_state == GameScreen.LIBRARY) {
      screen = loadImage("assests/img_library.png");
      image(screen,0.0, -height/5.9);   
   }
   if(g_state == GameScreen.DORMS) {
      screen = loadImage("assests/img_dorms_bedroom.png");
      image(screen,0.0, -height/5.9);   
   }
  
   if(g_state == GameScreen.RESULTS) {
      screen = loadImage("assests/img_Results.png");
      image(screen,0.0,10.0);   
   }
}

// callFirstGame - tour of the uni campus on click of buttons
void callFirstGameHUD() {
  printMSG("   PLACES TO CHECKOUT: "+ countPlaces, 0, int(height/1.06), height/19);
  //print some level stuff for our character
  printMSG("  AVERAGE JOE STATLINE:      FRESHMAN LEVEL: 50      SOCIAL: 50      GRADES: N/A      MENTAL: 50", 0, int(height/1.15), 15.0);
}

//mouseClickGS - gamestate mouse click function 
void mouseClickGS() {
  // make everything but the bottom part of the screen clickable
    if (g_state == GameScreen.WORLD &&
    !(mouseX >= 0 && mouseX <= width &&
      mouseY >= height/1.2 && mouseY <= height) ) {
  
      g_state = GameScreen.COMMONS; 
      countPlaces -=1;
      disableGUI = false;
      disableNext = true;
      selection +=1; 
  }
}
