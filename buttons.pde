
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
void guiManager() {
  if(!disableGUI) {
    drawButton();
    screenType(); 
  }
  drawLine();
}

void drawLine() {
  stroke(255);
  strokeWeight(6);
  line(0, height/1.2,  width, height/1.2);
}

void drawButton() {
  if(!disableNext) {
    fill(50);
    rect( fRectx, fRecty , fRectSOne, fRectSTwo); 
    fill(255);
    textFont(font); 
  }
  
 
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

void buttonCheck() {
    // check if the first box is working
  if(overRect(int(fRectx), int(fRecty), int(fRectSOne), int(fRectSTwo)) && selection == 1 && !disableGUI) {
     isTitle = false;
     selection = 2;
  } else if(overRect(int(fRectx), int(fRecty), int(fRectSOne), int(fRectSTwo)) && !disableGUI)  {
    selection +=1; 
  }
  
  if(!isTitle && overRect(int(sRectx), int(sRecty), int(fRectSOne), int(fRectSTwo)) && selection == 2 && !disableGUI) {
    isTitle = true;
    selection -=1;
  } else if(!isTitle && overRect(int(sRectx), int(sRecty), int(fRectSOne), int(fRectSTwo)) && !disableGUI && text3 == "skip") {
    selection +=2;
  } else if (!isTitle && overRect(int(sRectx), int(sRecty), int(fRectSOne), int(fRectSTwo)) && !disableGUI) {
    selection -=1;
  }
}

void screenType() {
  if(isTitle) {
    fill(255);
    textFont(font);
    text("UMBC TRAIL", width/5, height/2); 
    text("By: TEAM GOAT", width/8, height/1.6); 
  }
}


//processing refrence https://processing.org/examples/button.html
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
