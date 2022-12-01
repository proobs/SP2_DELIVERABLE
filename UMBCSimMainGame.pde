/*
 * MainGameFile.pde
 * Isaiah Turner, Mahad Osman, Chiji Ebenezar, Cameron
 * Desc: main game file for the game, all methods developed should be integrated here.
 */


GameScreen g_state = GameScreen.TITLE; //holds the game state

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



void setup() {   
  //set the screen size
  size(1000, 1000);
  
  font = createFont("assests/PixeloidMono-1G8ae.ttf", 100);
  textFont(font);
  
  //setup timesys
  timeSys = new TimeSystem(); 
  
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


void screenManager() {


  if (b_start.isClicked()) {
    g_state = GameScreen.SELECT_SCHEDULE;
    //gameHasStarted = true;
    b_start.setXPosition(-1000);
  }


  //if the mouse is over the start button and button is pressed, game state is WORLD
  // if game state is WORLD, the image in the center of the screen becomes the campus map
  // etc.....
  if (g_state == GameScreen.TITLE) {
    screen = loadImage("assests/img_titleScreen.png");
    image(screen, 0.0, 10.0);

  }

  if (g_state == GameScreen.SELECT_SCHEDULE) {
    screen = loadImage("assests/img_ScheduleSelect.png");
    image(screen, 0.0, 10.0);
    setupSchedule();
  }

  if (g_state == GameScreen.SELECT_MAJOR) {
    screen = loadImage("assests/img_ScheduleSelect.png");
    image(screen, 0.0, 10.0);
    selectMajor();
  }



  if (g_state == GameScreen.WORLD) {
    screen = loadImage("assests/img_WorldMap.png");
    image(screen, 0.0, 10.0);
    currentLocation = "MAP";
  }
  if (g_state == GameScreen.COMMONS) {
    screen = loadImage("assests/img_Commons.png");
    image(screen, 0.0, -300.0);
    currentLocation = "COMMONS";
  }
  if (g_state == GameScreen.LIBRARY) {
    screen = loadImage("assests/img_library.png");
    image(screen, 0.0, 10.0);
    currentLocation = "LIBRARY";
  }

  if (g_state == GameScreen.RAC) {
    screen = loadImage("assests/img_RAC.png");
    image(screen, 0.0, 10.0);
    currentLocation = "RAC";
  }


  if (g_state == GameScreen.DORMS) {
    screen = loadImage("assests/img_dorms_bedroom.png");
    image(screen, 200.0, 200.0);
  }

  if (g_state == GameScreen.RESULTS) {
    screen = loadImage("assests/img_Results.png");
    image(screen, 0.0, 10.0);
  }
}

void playerManager() {
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
    option1.setXPosition(-1000);
    option2.setXPosition(-1000);
   
  }
}


void selectMajor(){

  //do this inside of the zip:
  
 //create 2 buttons: STEM and Humanities

//if player chooses the STEM button, major = "STEM"
//if player chooses the Humanities button, major = "Humanities"


//before doing this, you need to create 2 button objects locally,
//and then a global String called seledtedMajor which will be set to " ".
//then go to drawHUD(), call text ()  and have it print selectedMajor to the screen

//

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
