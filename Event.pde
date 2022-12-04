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
  if (g_state == GameScreen.SELECT_PLAYER ){
    playerManager();
  }
}
