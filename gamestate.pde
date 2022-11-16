/*
gamestate.pde
Isaiah Turner
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
      image(screen,0.0,10.0);   
   }
   if(g_state == GameScreen.COMMONS) {
      screen = loadImage("assests/img_Commons.png");
      image(screen,0.0,-300.0);   
   }
  if(g_state == GameScreen.LIBRARY) {
      screen = loadImage("assests/img_library.png");
      image(screen,0.0,10.0);   
   }
   if(g_state == GameScreen.DORMS) {
      screen = loadImage("assests/img_dorms_bedroom.png");
      image(screen,200.0,200.0);   
   }
  
   if(g_state == GameScreen.RESULTS) {
      screen = loadImage("assests/img_Results.png");
      image(screen,0.0,10.0);   
   }
}
