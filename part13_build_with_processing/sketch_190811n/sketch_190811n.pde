/**
 * マウスの位置に応じて移動方向が変わる四角たち
 */
int maxColor;
float x, y, speed, angle, maxSpeed = 10;

void setup() {
  size(400, 400);
  maxColor = width;
  colorMode(HSB, maxColor);
  background(maxColor);
  rectMode(CENTER);
  frameRate(10);
  
  x = width / 2;
  y = height / 2;
  speed = 0;
  angle = 0;
}

void draw() {
  float acc = (mouseY - (height / 2));
  speed += acc * 0.01;
  if (speed < -maxSpeed) {
    speed = -maxSpeed; 
  }
  if (speed > maxSpeed) {
    speed = maxSpeed;
  }
  
  float ang = ((width / 2) - mouseX);
  angle += ang * 0.05;
  
  x += speed * sin(radians(angle));
  y += speed * cos(radians(angle));
  
  loopWorld();
  
  fill(abs(ang)*2, abs(acc)*2, maxColor);
  rect(x, y, 20, 20);
}

void loopWorld() {
  if (x < 0) x = width + x;
  if (x > width) x = x - width;
  if (y < 0) y = height + y;
  if (y > height) y = y - height; 
}
