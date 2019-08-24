// https://note.mu/outburst/n/n77e3e3c7d06c
int actRandomSeed = 0;
int size = 60;
int drawMode = 1;

void setup() {
  size(800, 800);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);
  noLoop();
}

void draw() {
  background(360);
  for (int y = 0; y < height + size; y += size) {
    for (int x = 0; x <= width + size; x += (size/2 * cos(radians(30))) * 2) {
      drawHexagon(x, y);
    }
  }
}

void drawHexagon(int posX, int posY) {
  float pX = -999;
  float pY = -999;
  
  beginShape();
  for (float theta=radians(30); theta < TWO_PI; theta += TWO_PI/6) {
    float x = posX + size/2 * cos(theta);
    float y = posY + size/2 * sin(theta);
    float diameter = random(size * 0.4);
    if (pX != -999) {
      strokeWeight(1);
      stroke(0);
      if (drawMode == 3)stroke(random(200, 360), 100, 100);
      if (random(1) > 0.66) {
        line(pX, pY, x, y);
        randomFillCol();
        ellipse(pX, pY, diameter, diameter);
      } else if (random(1) > 0.33) {
        line(posX, posY, x, y);
        randomFillCol();
        ellipse(posX, posY, diameter, diameter);
      } else {
        vertex(x, y);
      }
    }

    pX = x;
    pY = y;
  }
  noFill();
  endShape();
}

void randomFillCol() {
  noStroke();
  if (drawMode == 1) {
    if (random(1) > 0.66) {
      fill(340, 100, 100);
    } else if (random(1) > 0.33) {
      fill(0);
    } else {
      fill(360);
    }
  }

  if (drawMode == 2) {
    stroke(0);
    if (random(1) > 0.66) {
      fill(230, 100, 100);
    } else if (random(1) > 0.33) {
      fill(50, 100, 100);
    } else {
      fill(90, 100, 100);
    }
  }

  if (drawMode == 3) {
    noFill();
  }
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 's')saveFrame("####.png");

  if (key == '1')drawMode = 1;
  if (key == '2')drawMode = 2;
  if (key == '3')drawMode = 3;
}
