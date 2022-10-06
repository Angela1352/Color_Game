void game() {

  //background
  noStroke();
  fill(#bcf69a);
  tactile1(0, 0, 400, 600);
  rect(0, 0, 400, 600);
  fill(#f8aa9a);
  tactile2(400, 0, 400, 600);
  rect(400, 0, 400, 600);

  image(v, 150, 50, 100, 100);
  image(x, 550, 50, 100, 100);


  fill(colors[randomColor]);
  text(words[randomWord], 400, 300);


  size = size + 3;
  textSize(size);

  if (size > 260) wrong();

  //generate new
  if (randomColor == randomWord) {
    if (click == 1 || left == 1) {
      left = 0;
      correct();
      split();
    }

    if (click == 2 || right == 2) {
      right = 0;
      wrong();
    }
    click = 3;
  }

  if (randomWord != randomColor) {
    if (click == 1 || left == 1) {
      left = 0;
      wrong();
    }

    if (click == 2 || right == 2) {
      right = 0;
      correct();
      split();
    }
    click = 3;
  }
}



void gameClicks() {

  if (mouseX > 0 && mouseX < 400 && mouseY > 0 && mouseY < 600) {
    click = 1;
  }

  if (mouseX > 400 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
    click = 2;
  }
}



void tactile1(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(#D6F9C2);
  } else {
    fill(#bcf69a);
  }
}


void tactile2(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(#FACCC2);
  } else {
    fill(#f8aa9a);
  }
}

void split() {
  randomNum = (int) random(0, 10);

  if (randomNum < 5) randomColor = randomWord;
  if (randomNum >= 5) {
    while (randomColor == randomWord) {
      randomWord = (int) random(0, 6);
    }
  }
}


void correct() {
  randomWord = (int) random(0, 6);
  randomColor = (int) random(0, 6);
  score++;
  size = 50;
  success.rewind();
  success.play();
}

void wrong() {
  mode = GAMEOVER;
  failure.rewind();
  failure.play();
}
