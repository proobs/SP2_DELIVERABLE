// File: main.pde
// Author: TEAM 2 / TEAM GOAT: Chiji, Mahad, Isaiah, Alexus, Camron
// Date: 11/17/2022
// Class: COMP 101
// Description: Hosts all button code

// guiSetup() - runs during setup and initiates global variables
void guiSetup() {
  
 // variable setup for first rect
  fRectx =    width  / 1.75; 
  fRecty =    height / 1.154;
  fRectSOne = width  / 4;
  fRectSTwo = height / 9;
  
  //  variable setup for second
  sRectx =    width  / 5; 
  sRecty =    height / 1.154;
}

//guiManager - runs during draw(); and checks if gui is enabled or disabled to draw buttons on screen, always has drawLine running
void guiManager() {
  if(!disableGUI) {
    drawButton();
    screenType(); 
  }
  drawLine();
}

//drawLine - draws a white line near the bottom 1/6 of the screen
void drawLine() {
  stroke(255);
  strokeWeight(6);
  line(0, height/1.2,  width, height/1.2);
}

//drawButton - draws back button, next button, and go button
void drawButton() {
  // checks if the nextKey is disabled, if not, run button code
  if(!disableNext) {
    fill(50);
    rect( fRectx, fRecty , fRectSOne, fRectSTwo); 
    fill(255);
    textFont(font); 
  }
  
   //if next key isn't disabled, draw text, either go or next oover button
  if(isTitle && !disableNext) { 
    text(text2, width / 1.7, height/1.06);
   } else if (!isTitle && !disableNext) {
    text(text1, width / 1.7, height/1.06);
   }
  // if isn't title spawn left button 
  if(!isTitle) {
    fill(50);
    rect(sRectx, sRecty, fRectSOne, fRectSTwo);
     fill(255);
    textFont(font); 
    text(text3, width/ 4.9, height/1.06);
  }
}

//buttonCheck - runs during onMouseClick(), if mouse is over button, allow action to be done
void buttonCheck() {
    // if is start screen, on click disable isTitle bool and get to second slide
  if(overRect(int(fRectx), int(fRecty), int(fRectSOne), int(fRectSTwo)) && selection == 1 && !disableGUI) {
     isTitle = false;
     selection = 2;
     // if is any other screen, just go to the next slide
  } else if(overRect(int(fRectx), int(fRecty), int(fRectSOne), int(fRectSTwo)) && !disableGUI)  {
    selection +=1; 
  }
  
  // if selection is 2, allow back key to go back to title and reanble isTitle
  if(!isTitle && overRect(int(sRectx), int(sRecty), int(fRectSOne), int(fRectSTwo)) && selection == 2 && !disableGUI) {
    isTitle = true;
    selection -=1;
    // if text3 == skip then skip a slide
  } else if(!isTitle && overRect(int(sRectx), int(sRecty), int(fRectSOne), int(fRectSTwo)) && !disableGUI && text3 == "skip") {
    selection +=2;
    // if selection is anything else just increment
  } else if (!isTitle && overRect(int(sRectx), int(sRecty), int(fRectSOne), int(fRectSTwo)) && !disableGUI) {
    selection -=1;
  }
}

//screenType - homeScreen message
void screenType() {
  if(isTitle) {
    fill(255);
    textFont(font);
    text("UMBC TRAIL", width/5, height/2); 
    text("By: TEAM GOAT", width/8, height/1.6); 
  }
}


//processing refrence https://processing.org/examples/button.html
//overRect - checks if mouse is over a rectangle with its vriables passed through
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
