/**
 * ドラッグして球を残像ありで動かす
 */
float FRICTION = 0.98;
float radius = 40;
boolean onMouse = false;
boolean onDrag = false;

float x, y;
float spx, spy;

void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  background(99);
  strokeWeight(1);
  frameRate(60);
  
  x = width/2;
  y = height/2;
  spx = 0;
  spy = 0;
}

void draw() {
  if (onDrag) {
    fadeToWhite();
  }
  
  if (onDrag) {
    x = mouseX;
    y = mouseY;
    spx = mouseX - pmouseX;
    spy = mouseY - pmouseY;
  } else {
    spx = spx * FRICTION;
    spy = spy * FRICTION;
    x = x + spx;
    y = y + spy;
    bounce();
  }
  
  checkOnMouse();
  
  ellipse(x, y, radius*2, radius*2);
}

void bounce() {
  float bounceMinX = radius;
  float bounceMaxX = width - radius;
  float bounceMinY = radius;
  float bounceMaxY = height - radius;
  
  if (x < bounceMinX || x > bounceMaxX) {
    spx = -spx * FRICTION;
    if (abs(spx) < 1) {
      spx = 0; 
    }
    if (x < bounceMinX) {
      x = bounceMinX - (x - bounceMinX);
    }
    if (x > bounceMaxX) {
      x = bounceMaxX - (x - bounceMaxX); 
    }
  }
  
  if (y < bounceMinY || y > bounceMaxY) {
    spy = -spy * FRICTION;
    if (abs(spy) < 1) {
      spy = 0; 
    }
    if (y < bounceMinY) {
      y = bounceMinY - (y - bounceMinY);
    }
    if (y > bounceMaxY) {
      y = bounceMaxY - (y - bounceMaxY); 
    }
  }
}

void checkOnMouse() {
  noStroke();
  stroke(90, 60, 99);
  
  if (dist(mouseX, mouseY, x, y) < radius) {
    onMouse = true;
    fill(90, 99, 99, 30);
  } else {
    onMouse = false;
    fill(90, 0, 99, 30);
  }
}

void fadeToWhite() {
  noStroke();
  fill(99, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void mousePressed() {
  if (onMouse) {
    onDrag = true; 
  }
}

void mouseReleased() {
  onDrag = false;
}
