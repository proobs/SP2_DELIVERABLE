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
     case 5: 
       // first week finished
       printMSG(" CONGRATS, \n THE AVERAGE JOE. \n\n IN YOUR FIRST WEEK \n YOU FIGURED OUT \n THE LAYOUT OF UMBC", int(height/100), height/5, textSize);
       break;
     case 6: 
       // state line changes
       printMSG(" AS A RESULT, \n YOUR STATLINE HAS \n CHANGED. \n FRESHMAN: -25, \n SOCIAL +1 \n MENTAL: +25", int(height/100), height/5, textSize);
       break;
     case 7: 
       printMSG(" WEEK 2: \n YOU HAVE MULTIPLE \n CLASSES TO ATTEND \n FOR THE FIRST TIME \n IF YOU FAIL EARLY \n YOU CAN LOSE. ", int(height/100), height/5, textSize);
       break;
     case 8: 
       printMSG(" POP ENTRANCE QUIZ! \n IN MATH YOU HAVE \n A PLACEMENT \n THAT WILL DETERMINE YOUR \n CLASS ELEGIBILITY \n DO YOUR BEST! ", int(height/100), height/5, textSize);
       break; 
     case 9:
       mathGame(); 
       break; 
  }
  
}

//drawSelection - 3 boxes that display a character selection
void drawSelection() {
  //top screen msg
  printMSG("Choose your character", int(height/100), height/5, textSize);
 
  // 3 boxes
  //box on far right
  fill(255/2); 
  rect(width-(width/2.99), height/4, width/3, width/2);
  printMSG("TBD", int(width-(width/3.6)), height/2, textSize);
  
  //middle box
  fill(255/2); 
  rect(width - (2 * (width/2.99)), height/4, width/3, width/2);
  
  // far left
  fill(255/2); 
  rect(width - (3 * (width/2.99)), height/4, width/3, width/2);
  printMSG("TBD", width/14 , height/2, textSize);
  
}

//drawSpirtes - characters
void drawSprites() {
  
}

//drawGame - slide 3
void drawGame() {
  printMSG(" YOU'VE CHOSEN \n THE AVERAGE JOE. \n\n IN YOUR FIRST WEEK \n FIGURE OUT \n THE LAYOUT OF UMBC", int(height/100), height/5, textSize);
  
}

//mathGame - code for the math mini game
void mathGame() {
  // remove next and back
  if(mathGame) { disableGUI = true; 
  
    // bottom of screen messaes
    printMSG("  AVERAGE JOE STATLINE:      FRESHMAN LEVEL: 25      SOCIAL: 51      GRADES: N/A      MENTAL: 75", 0, int(height/1.15), 15.0);
    printMSG("     MATH TEST ANSWERS: " + mathAns, 0, int(height/1.06), height/19);
    
    //math questions
    printMSG(" QUESTION 1: \n x-10=", int(height/100), height/5, textSize);
  
  //if game end, go next screen
  }else {
    if(studentPassed) {
      printMSG(" YOU'VE PASSED, \n THE AVERAGE JOE. \n\n IN YOUR SECOND WEEK \n YOUR NEW SCORE \n IS POSTED", int(height/100), height/5, textSize);
      printMSG("  AVERAGE JOE STATLINE:      FRESHMAN LEVEL: 25      SOCIAL: 51      GRADES: 100%      MENTAL: 75", 0, int(height/1.15), 15.0);
    } else {
      printMSG(" YOU'VE FAILED, \nYOUR GAME IS OVER \n\n", int(height/100), height/5, textSize);
      printMSG("  AVERAGE JOE STATLINE:      FRESHMAN LEVEL: 0      SOCIAL: 0      GRADES: 0%      MENTAL: 0%", 0, int(height/1.15), 15.0);
    }
    
  }
  
}

//numCheck - code to check math num / enter it in
void numCheck() {
  // if 0-9 enter on kb
  if( key >= '0' && key <= '9' ){
   str_num += key; 
  }
  // register number with enter key
  if( key == ENTER || key == RETURN ){
    num = int( str_num );
    str_num = "";
    mathAns = num;
    
    //end game
    mathGame = false; 
    
    // if correct answer, pass, if not fail
    if( mathAns == 10) {
      studentPassed = true;
    } else {
      studentPassed = false; 
    }
  }
  
}
