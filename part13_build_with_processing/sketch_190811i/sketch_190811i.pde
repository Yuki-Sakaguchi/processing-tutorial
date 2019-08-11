/**
 * マウススピードに合わせて大きさと色を変える
 */
int maxColor;

void setup() {
  size(600, 600);
  maxColor = width;
  colorMode(HSB, maxColor);
  background(maxColor - 1);
  frameRate(24);
}

void draw() {
  fadeToWhite();
  
  // pmouseX, pmouseYは前フレームのマウスポインタの位置
  float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
  
  noStroke();
  fill(mouseY, min(speed * 2, maxColor - 1), maxColor - 1);
  ellipse(mouseX, mouseY, speed, speed);
}

void fadeToWhite() {
  noStroke();
  fill(maxColor - 1, maxColor * 0.05);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
