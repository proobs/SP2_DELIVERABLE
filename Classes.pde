/*
 * Classes.pde
 * Isaiah Turner, Mahad Osman, Chiji Ebenezar, Cameron
 * Desc: All classes here
 */

/*
 * GameScreen - controls the game state
 */
enum GameScreen {
  TITLE, SELECT_SCHEDULE, SELECT_MAJOR, WORLD, DORMS, LIBRARY, COMMONS, RAC, RESULTS;
}

/*
 * Button - Class that manages all buttons in the game and 
 */ 
class Button {
  PVector Pos = new PVector(100, 50); //this is a vector that represents button position
  
  // width and height if box
  int iWidth;
  int iHeight;
  
  int stroke_w; //stroke weight
  
  // text 
  String text;
  int text_size;
  int text_color;
  int textX;
  int textY;
  
  //RGB colors
  int colr1;
  int colr2;
  int colr3;
  
  //check if clicked
  boolean pressed;
  boolean clicked;

  /* Button() - initilization of button class and variables.
   * @param x - x value
   * @param y - y value
   * @param w - width
   * @param h - height
   * @param t - text message
   * @param ts - text size 
   * @param r - rgb
   * @param g - rgb
   * @param b - rgb
   * @param tx - text X axis
   * @param ty - text Y axis 
   * @param tc - text color 
   */
  Button(int x, int y, int w, int h, String t, int ts, int r, int g, int b, int tx, int ty, int tc)
  {
    Pos.x = x;
    Pos.y = y;
    iWidth = w;
    iHeight = h;
    text = t;
    text_size = ts;
    colr1 = r;
    colr2 = g;
    colr3 = b;
    textX = tx;
    textY = ty;
    text_color = tc;
  }


 /*
  * Render() - draws the button 
  */
  void Render() { 
    // color of box
    fill(colr1, colr2, colr3);
    rect(Pos.x, Pos.y, iWidth, iHeight);
    textAlign(CENTER, CENTER);
    fill(text_color);
    textSize(text_size);
    text(text, textX, textY);
  }
  /* 
   * setXPosition - set x
   */
  void setXPosition(int x_) {
    Pos.x = x_;
    textX = x_;
  }

  /*
   * update - checks if mouse is click box
   */
  void update() {
    if (mousePressed == true && pressed == false) { // if we clicked
      pressed = true;
      //and if mouse is in the button bounds
      if (mouseX >= Pos.x && mouseX <= Pos.x+iWidth && mouseY >= Pos.y && mouseY <= Pos.y + iHeight) {
        clicked = true;
        }
    } else {
      pressed = false;
      clicked = false;
    }
  }
  
  /* 
   * isClicked() - checked if button is clicked
   */
  boolean isClicked() {
    return clicked;
  }
}

/*
 * TimeSystem - Class that manages all time
 */ 
class TimeSystem {
  // time
  int minutes = 0;
  int hours = 0;
  int days = 0;
  int weeks = 0;
  
  //internal bools
  boolean thresh1;
  boolean thresh2;
  boolean thresh3; 

  // TimeSystem constructor - Must be run in setup() 
  TimeSystem() {}

  // runTime - runs every 42 frames, must be in draw(); 
  void runTime() {

    thresh1 = false;
    thresh2 = false;
    thresh3 = false;

    minutes++;
    //timeBlockY+=2;


    if (minutes > 30 && !thresh1) {
      minutes = 0;
      hours+= 1;
      thresh1 = true;
    }

    if (hours > 5 && !thresh2) {
      hours = 0;
      days += 1;
      thresh2 = true;
    }


    if (days >=7 && !thresh3) {
      weeks += 1;
      thresh3 = true;
    }
  }
  /* 
   * currentTime - returns current time
   * @param format - if true format into w/d/h/m, if false normal formal. First allows for ease of testing
   */
  String currentTime(boolean format) {
    if(format) {
      return "time: " + str(weeks) + "/" + str(days) + "/" + str(hours) + "/" + str(minutes) + "\n";
    } else {
      return "Hours: " + str(timeSys.hours) + " " + "Day: " + str(timeSys.days)+" " + "Weeks: " + str(timeSys.weeks);
    }
  }
}

class Player {
  
  Player() {
    
  }
  
}
