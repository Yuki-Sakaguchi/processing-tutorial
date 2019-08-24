// https://note.mu/outburst/n/n0c63d0304663
import processing.opengl.*;

int actRandomSeed = 0;
int rectSize = 100;
int h = 360;

void setup() {
  size(800, 800, OPENGL);
  pixelDensity(1);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
}

void draw() {
  randomSeed(actRandomSeed);
  drawBackground();
  tile();
}

void drawBackground() {
  background(360, 9, 100);
  strokeWeight(2);
  float xStep = 5;
  for (float y=0; y<height+20; y++) {
    for (float x=random(xStep); x<width + 20; x+=random(xStep)) {
      float s = map(dist(width/2, height, x, y), 0, height, 100, 40);
      stroke(h, s, random(60, 100), 90);
      line(x-10, y, x+10, y);
    }
  }
}

void tile() {
  for (int y=rectSize/2; y<height; y+=rectSize) {
    for (int x=rectSize/2; x<width; x+=rectSize) {
      float angleNoise = map(noise(x* 0.001, y * 0.001), 0, 1, -PI, PI)/2;
      pushMatrix();
      translate(x, y, sqrt(sq(rectSize/2)+sq(rectSize/2)));
      rotateX(angleNoise);
      rotateY(angleNoise);
      strokeWeight(1);
      stroke(0);
      fill(random(360), random(50));
      rect(0, 0, rectSize, rectSize);
      popMatrix();
    }
  }
}

void mousePressed() {
  actRandomSeed = (int)random(10000);
  int newNoiseSeed = (int)random(10000);
  noiseSeed(newNoiseSeed);
}

void keyPressed() {
  if (key == 's')saveFrame("####.png");

  if (key == '1')h = 360;
  if (key == '2')h = 202;
  if (key == '3')h = 21;
}
