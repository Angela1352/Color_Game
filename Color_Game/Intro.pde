int counter = 0;


void intro() {

  music.play();

  //animated Gif
  image(gif[f], 0, 0, width, height);
  f++ ;
  if (f == numberOfFrames) f = 0;

  counter++;

  //text
  if (counter <= 15) fill(255);

  if (counter > 15 && counter <= 30) fill(#FFC5E2);

  if (counter > 30 && counter <= 45) fill(#9999FF);

  if (counter > 45 && counter <= 60) fill(#99CC99);

  textFont(font1);
  textSize(120);
  text("COLOR GAME", 400, 230);

  if (counter == 60) counter = 0;

  //button
  strokeWeight(5);
  fill(pink);
  tactile(320, 350, 160, 80);
  rect(320, 350, 160, 80, 2);
  textSize(60);
  fill(255);
  text("play", 400, 380);
}

void introClicks() {
  if (mouseX > 320 && mouseX < 480 && mouseY > 350 && mouseY < 430) {
    mode = GAME;
  }
}


void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(255);
  } else {
    stroke(0);
  }
}
