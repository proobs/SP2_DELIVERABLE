
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
    drawLine();
    drawButton();
    screenType(); 
  }
}

void drawLine() {
  stroke(255);
  strokeWeight(6);
  line(0, height/1.2,  width, height/1.2);
}

void drawButton() {
  fill(50);
  rect( fRectx, fRecty , fRectSOne, fRectSTwo); 
  fill(255);
  textFont(font); 
  
  String text1 = "next", text2 = "go";
  if(isTitle) { 
    text(text2, width / 1.7, height/1.06);
   } else {
    text(text1, width / 1.7, height/1.06);
   }
  // if isn't title spawn left button 
  if(!isTitle) {
    fill(50);
    rect(sRectx, sRecty, fRectSOne, fRectSTwo);
     fill(255);
    textFont(font); 
    text("back", width/ 4.9, height/1.06);
  }
}

void buttonCheck() {
    // check if the first box is working
  if(overRect(int(fRectx), int(fRecty), int(fRectSOne), int(fRectSTwo)) && selection == 1) {
     isTitle = false;
     selection = 2;
  } else if(overRect(int(fRectx), int(fRecty), int(fRectSOne), int(fRectSTwo)))  {
    selection +=1; 
  }
  
  if(!isTitle && overRect(int(sRectx), int(sRecty), int(fRectSOne), int(fRectSTwo)) && selection == 2) {
    isTitle = true;
    selection -=1;
  } else if(!isTitle && overRect(int(sRectx), int(sRecty), int(fRectSOne), int(fRectSTwo))) {
    selection -=1;
  }
}

void screenType() {
  if(isTitle) {
    fill(255);
    textFont(font);
    text("UMBC TRAIL", width/5, height/2); 
    text("By: TEAM 2", width/5, height/1.6); 
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
