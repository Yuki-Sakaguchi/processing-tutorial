float x, y;
float cx, cy;
float angle;
float r;

void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  background(99);
  frameRate(36);
  
  cx = width/2;
  cy = height/2;
  angle = 0;
  r = 100;
}

void draw () {
  fadeToWhite();
  
  angle += 10;
  
  x = cx + (r * cos(radians(angle)));
  y = cx + (r * sin(radians(angle)));
  
  noStroke();
  fill(0);
  rectMode(CENTER);
  rect(x, y, 10, 10);
}

void fadeToWhite () {
  noStroke();
  fill(99, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
