//Angela Chen
//Sept 28, 2022


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//mode framework
int mode;
final int INTRO     = 1;
final int GAME      = 2;
final int PAUSE     = 3;
final int GAMEOVER  = 4;


//color palette
color red      = #ff0028;
color orange   = #f3722c;
color yellow   = #f9c74f;
color green    = #198C19;
color blue     = #168aad;
color purple   = #9b5de5;
color pink     = #f15bb5;

int randomWord = (int) random(0, 6);
int randomColor = (int) random(0, 6);

String[] words = {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE", "PINK"};
color[] colors = {red, orange, yellow, green, blue, purple, pink};


//key variables
int left, right;


//images & fonts
PFont font1;
PImage v, x, background;


//sound variables
Minim minim;
AudioPlayer music, success, failure;


//others
int score, highscore;
int click;
int size;
float randomNum;


//animation variables
PImage[] gif;
int numberOfFrames;
int f = 0;



void setup() {
  size(800, 600);
  background(0);
  textAlign(CENTER, CENTER);
  mode = INTRO;

  numberOfFrames = 50;
  gif            = new PImage[numberOfFrames];
  font1          = createFont("font1.ttf", 100);
  v              = loadImage ("v.png");
  x              = loadImage ("x.png");
  background     = loadImage ("background.jpg");

  score = 0;
  highscore = 0;
  size  = 50;

  minim    = new Minim(this);
  music    = minim.loadFile("music.mp3");
  success  = minim.loadFile("success.wav");
  failure  = minim.loadFile("failure.wav");

  randomNum = random(0, 10);

  int i = 0;

  while (i < numberOfFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.04s.gif");
    i++;
  }
}



void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}



void reset() {
  mode = INTRO;

  numberOfFrames = 50;
  gif            = new PImage[numberOfFrames];
  font1          = createFont("font1.ttf", 100);
  v              = loadImage ("v.png");
  x              = loadImage ("x.png");
  background     = loadImage ("background.jpg");

  score = 0;
  size = 50;

  minim    = new Minim(this);
  music    = minim.loadFile("music.mp3");
  success  = minim.loadFile("success.wav");
  failure  = minim.loadFile("failure.wav");


  int i = 0;

  while (i < numberOfFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.04s.gif");
    i++;
  }
  music.rewind();
  music.play();
}


//break code down into functions
//add keyboard
