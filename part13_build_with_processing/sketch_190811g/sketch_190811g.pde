float SCALE = 0.0005;

float x, y;
float spx, spy;
float acx, acy;
int radius = 10;

void setup () {
  size(400, 400);
  colorMode(HSB, 100);
  background(0);
  frameRate(60);
  
  x = random(width);
  y = random(height);
  spx = random(-3, 3);
  spy = random(-3, 3);
  acx = acy = 0;
}

void draw() {
  fadeToWhite();
  
  // 引力の中心
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 6, 6);
  
  attraction(width/2, height/2);
  
  ellipse(x, y, radius*2, radius*2);
}

void attraction(float targetX, float targetY) {
  float distX = x - targetX;
  float distY = y - targetY;
  
  acx = SCALE * sq(distX);
  if (x > targetX) {
    acx = -acx; 
  }
  
  acy = SCALE * sq(distY);
  if (y > targetY) {
    acy = -acy; 
  }
  
  spx += acx;
  spy += acy;
  x = x + spx;
  y = y + spy;
  
  float dist = dist(x, y, targetX, targetY);
  fill(0, 99, min(dist * 0.8, 99));
}


void fadeToWhite() {
  noStroke();
  fill(99, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
