void gameover() {
  music.pause();

  image(background, 0, 0, 800, 600);

  textFont(font1);
  textSize(120);
  fill(red);
  text("G", 150, 230);
  fill(orange);
  text("A", 223, 230);
  fill(yellow);
  text("M", 310, 230);
  fill(green);
  text("E", 385, 230);
  fill(blue);
  text("O", 445, 230);
  fill(purple);
  text("V", 515, 230);
  fill(pink);
  text("E", 585, 230);
  fill(red);
  text("R", 650, 230);

  //score + highscore
  if (score > highscore) {
    highscore = score;
  } 
  
  textSize(55);
  fill(255);
  text("~ BEST: " + highscore + " ~", 210, 330);
  text("~ SCORE: " + score + " ~", 590, 330);


  //play again
  strokeWeight(5);
  fill(pink);
  tactile(320, 400, 160, 80);
  rect(320, 400, 160, 80, 2);
  textSize(50);
  fill(255);
  text("again", 400, 430);
}


void gameoverClicks() {
  if (mouseX > 320 && mouseX < 480 && mouseY > 400 && mouseY < 480) {
    mode = INTRO;
    reset();
  }
}
