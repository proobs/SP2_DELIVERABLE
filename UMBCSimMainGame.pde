/*
 * MainGameFile.pde
 * Isaiah Turner, Mahad Osman, Chiji Ebenezar, Cameron
 * Desc: main game file for the game, all methods developed should be integrated here.
 */


GameScreen g_state = GameScreen.TITLE; //holds the game state
Major g_major; //major

boolean gameHasStarted = false; //check if game start


PImage screen; //variable that holds the center image
PImage HUD_image; //hold the HUD image
PFont font; //global font
String currentLocation  = " ";


//int timeBlockY = 120;
int [] tickY = {120, 240, 360, 480, 600};
int []chosenSchedule = {0,0};

//PLayer Variables
int health = 100;
float money = 150.00;
String chosenMajor = " ";

//timeSystem vars
TimeSystem timeSys; 

//button object declarations, most of these are used in the HUD
Button b_start;
Button b_back;

Button b_study;
Button b_eat;
Button b_hangout;
Button b_sleep;

Button b_commons;
Button b_library;
Button b_dorm;
Button b_RAC;

Button option1;
Button option2;

Button major_option1;
Button major_option2;

int daySchedule;



void setup() {   
  //set the screen size
  size(1000, 1000);
  
  font = createFont("assests/PixeloidMono-1G8ae.ttf", 100);
  textFont(font);
  
  //setup timesys
  timeSys = new TimeSystem(); 
  
  //
  loadImages(); 
  
  //setup buttons
  b_start = new Button (500, 800, 120, 80, "Start", 30, 255, 255, 255, 570,830, 0);
  b_commons =  new Button(300, 200, 10, 10, " ", 23, 255, 0, 0, 0, 0,0);
  b_library =  new Button(800, 600, 10, 10, " ", 23, 255, 0, 0, 0,0,0);
  b_RAC =  new Button(450, 300, 10, 10, " ", 23, 255, 0, 0, 0,0,0);
  b_dorm = new Button(250, 400, 10, 10, " ", 23, 255, 0, 0, 0,0,0);
}


void draw() {
  background(0);
  
  if(gameHasStarted && frameCount % 42 == 0) {
    timeSys.runTime();  
  }
  
  //run screenManager
  screenManager();
  
  //draw initial hud
  drawHUD();
  
  // 
  b_start.Render();
  b_start.update();
}

//setupSchedule() - this function assigns a specific schedule to the character
void setupSchedule() {

  //arrays that hold the schedule, 
  int [] option1Schedule = {120+100, 360+100};
  int [] option2Schedule = {240+100, 600+100};
  
  fill(255);
  text("PICK A SCHEDULE",500,150);

  option1 = new Button (200, 200, 300, 500, "    Classes on \n Day 1 \n and Day 3", 20, 0, 0, 0, 350,300,255);
  option2 = new Button (600, 200, 300, 500, "    Classes on\n Day 2 and\n Day 4", 20, 0, 0, 0, 750,300,255);
  option1.Render();
  option1.update();
  option2.Render();
  option2.update();
  
  major_option1 = new Button(400, 200, 200, 500, "STEM", 20, 0, 0, 0, 200,300,255);
  major_option2 = new Button(600, 200, 200, 500, "HUMANITIES", 20, 0, 0, 0, 500 ,400,255);
  
  if (option1.isClicked()) { //if player chooses schedule 1, then that schedule will be displayed on the SCHEDULE HUD as 
  //rectangle ticks at different y positions
  for (int i = 0; i<option1Schedule.length; i++) {
      chosenSchedule[i] = option1Schedule[i];
      
    }
  }

  if (option2.isClicked()) {

    for (int i = 0; i<option1Schedule.length; i++) {
      chosenSchedule[i] = option2Schedule[i];
    }
  }

  if (option1.isClicked() || option2.isClicked()) {

    g_state = GameScreen.SELECT_MAJOR;
    //option1.setXPosition(-1000);
    //option2.setXPosition(-1000);
   
  }
}


void selectMajor(){
  
  fill(255);
  text("PICK A MAJOR!", 500, 150);

  option1 = new Button (200, 200, 300, 200, " STEM: \n Your class will be \n difficult, \n but rewarding.", 20, 0, 0, 0, 350,300,255);
  option2 = new Button (600, 200, 300, 200, " Fine Arts: \n You will get to \n be very creative!", 20, 0, 0, 0, 750,300,255);
  option1.clicked = false;
  option2.clicked = false;
  option1.Render();
  option1.update();
  option2.Render();
  option2.update();

  
  if (option1.isClicked()) { 
    g_major = Major.STEM;
  }

  if (option2.isClicked()) {
    g_major = Major.ARTS;  
  }

  if (option1.isClicked() || option2.isClicked()) {

    g_state = GameScreen.SELECT_PLAYER;
    //option1.setXPosition(-1000);
    //option2.setXPosition(-1000);
   
  }

}


void drawSchedule(){
//will also write this
//draw the tick marks going down the HUD
//then make the time bar line up with each, and when they line up, make event happen


}

void Planner() {
  //draw the planner page on the HUD
  fill(255);
  rect(880, 120, 100, 800);
  fill(0, 255, 0);
  //rect(880, timeBlockY, 100, 15); //timeBlockY is incremented in TimeSystem() for every frame
  text("                     SCHED:  ", 780, 80);
  for (int i=0; i<tickY.length; i++) { //draw the ticks
    fill(0);
    rect(880, tickY[i], 25, 15);
  }
}

/* 
 * endOfGamePromt() - called after 15 weeks
 */ 
void endOfGamePrompt() {
  gameHasStarted =  false; 
}
