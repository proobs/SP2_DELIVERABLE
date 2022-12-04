String currentScreen = "";
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;

void loadImages() {
  a = loadImage("assests/collegetrailscreenresize.jpg");
  b = loadImage("assests/studentathletepixel.png");
  c = loadImage("assests/artstudentpixel.png");
  d = loadImage("assests/averagejoepixel.png");
  e = loadImage("assests/academicweapon.png");
}

void playerManager() {
    background(0);
    fill(255);
    noStroke();
    rect(25, height/2, 150, 200);
    rect(280, height/2, 150, 200);
    rect(550, height/2, 150, 200);
    rect(810, height/2, 150, 200);
    text("CHOOSE YOUR CHARACTER!", width/2, 50);
    text("Student", 100, 100);
    text("Athlete", 100, 150);
    text("Artsy", 355, 100);
    text("Average Joe", 630, 100);
    text("Academic", 880, 100);
    text("Weapon", 880, 150);
    image(b, 25, height/2);
    b.resize(175, height/2);
    image(c, 280, height/2);
    c.resize(175, height/2);
    image(d, 550, height/2);
    d.resize(175, height/2);
    image(e, 810, height/2);
    e.resize(175, height/2);
   if (currentScreen == "intro") {
    background(0);
    fill(255, 255, 255);
    text("STORY", width/2, 25);
    textSize(30);
    text("You are a freshman at college, all on your own!", width/2, 100);
    text("Across your first fifteen weeks, you will", width/2, 200);
    text("navigate the highs and lows of a college student", width/2, 250);
    text("both in and out of campus.", width/2, 300);
    text("The goal is to maintain happiness across your", width/2, 400);
    text("first semester, however that may be.", width/2, 450);
    text("Click anywhere to continue!", width/2, 525); 
  }
}

void mouseClicked() {
  if(g_state == GameScreen.SELECT_PLAYER) {
    currentScreen = "intro";
  } 
  if(g_state == GameScreen.SELECT_PLAYER && currentScreen == "intro") {
    g_state = GameScreen.WORLD; 
    gameHasStarted = true; 
  }
}
