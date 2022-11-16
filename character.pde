void drawCharacter() {
  switch (selection) {
    // on character selection screen 
    case 2: 
      drawSelection();
      drawSprites(); 
      break; 
    // after character is selected  
    case 3:
      drawGame();
      break; 
    case 4: 
       disableGUI = true; 
       g_state = GameScreen.WORLD;
       break;
  }
  
}

//draw selection screen
void drawSelection() {
  printMSG("Choose your character", int(height/100), height/5, height/14.28);
 
  // 3 boxes
  //box on far right
  fill(255/2); 
  rect(width-(width/2.99), height/4, width/3, width/2);
  printMSG("TBD", int(width-(width/3.6)), height/2, height/14.28);
  
  //middle box
  fill(255/2); 
  rect(width - (2 * (width/2.99)), height/4, width/3, width/2);
  
  // far left
  fill(255/2); 
  rect(width - (3 * (width/2.99)), height/4, width/3, width/2);
  printMSG("TBD", width/14 , height/2, height/14.28);
  
}

//draw spirte characters
void drawSprites() {
  
}

//draw selection 3
void drawGame() {
  printMSG(" YOU'VE CHOSEN \n THE AVERAGE JOE. \n\n IN YOUR FIRST WEEK \n FIGURE OUT \n THE LAYOUT OF UMBC", int(height/100), height/5, height/14.28);
}
