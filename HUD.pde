void drawHUD() {

  //display logistics
  int HUD_X = 230;
  int hudWidth = 100;
  int hudHeight = 50;
  int text_size = 20;
  int spacing = 120;
  int HUD_Y = 850;

  //button instantiations
  //Button ( x position, y position , Width, Height , text , textSize , red , green , blue, textColor )

  b_study = new Button(HUD_X, HUD_Y, hudWidth, hudHeight, "Study", text_size, 255, 255, 255,200,300, 0);
  b_eat = new Button(HUD_X+spacing, HUD_Y, hudWidth, hudHeight, "Eat", text_size, 255, 255, 255, 300,500,0);
  b_sleep = new Button(HUD_X+2*spacing, HUD_Y, hudWidth, hudHeight, "Sleep", text_size, 255, 255, 255, 500,600, 0);
  b_hangout = new Button(HUD_X+3*spacing, HUD_Y, hudWidth, hudHeight, "Hangout", text_size, 255, 255, 255, 700,800, 0);
  b_back = new Button(100, 450, hudWidth, hudHeight, "Back", text_size, 255, 255, 255, 800,900,0);



  //instantiate buttons for location
  if (gameHasStarted) {
    //draw HUD sprite
    HUD_image = loadImage("assests/img_HUD.png");
    image(HUD_image, 0, 0);


    //draws player options
    b_study.Render();
    b_study.update();
    b_eat.Render();
    b_eat.update();
    b_sleep.Render();
    b_sleep.update();
    b_hangout.Render();
    b_hangout.update();


    Planner();

    //draw locations
    b_commons.Render();
    b_commons.update();
    
    b_library.Render();
    b_library.update();
    
    b_dorm.Render();
    b_dorm.update();
    
    b_RAC.Render();
    b_RAC.update();

    fill(0);
    rect(100, 200, 100, 400);
    fill(255);
    text("STATS:-\n-----\n" + " Health:"+str(health) +"%" +"\n"+ "Money:" + "$" +str(money), 100, 300);
    textSize(30);
    text(timeSys.currentTime(false), 300, 80);
    b_back.Render();
    b_back.update();
  }

  //if any of the buttons is clicked, set the x of all of them to -1000
  if (b_commons.isClicked() || b_library.isClicked() || b_dorm.isClicked() || b_RAC.isClicked()) {
   
    
    
   
  }
  if (b_commons.isClicked()) {
    g_state = GameScreen.COMMONS;
    b_commons.setXPosition(-1000);
  }
  if (b_library.isClicked()) {
    g_state = GameScreen.LIBRARY;
    b_library.setXPosition(-1000);
  }
  if (b_dorm.isClicked()) {
    g_state = GameScreen.LIBRARY;
    b_dorm.setXPosition(-1000);
  }
  if (b_RAC.isClicked()) {
    g_state = GameScreen.RAC;
    b_RAC.setXPosition(-1000);
  }
  if (b_back.isClicked()) {
    g_state = GameScreen.WORLD;

    b_commons.setXPosition(300);
    b_library.setXPosition(800);
    b_dorm.setXPosition(450);
    b_RAC.setXPosition(250);
  }
  //notOnMap = true
  //if back is pressed, reset the buttons to original x pos
}
