/**
 * マウスに位置を追従する虫
 */
int length = 100;

float[] x = new float[length];
float[] y = new float[length];
float[] spx = new float[length];
float[] spy = new float[length];
float[] speedRate = new float[length];

void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  background(99);
  frameRate(60);
  
  for (int i = 0; i < length; i++) {
    x[i] = random(width);
    y[i] = random(height);
    spx[i] = spy[i] = 0;
    speedRate[i] = random(0.001, 0.001);
  }
}

void draw() {
  background(99);
  
  for (int i = 0; i < length; i++) {
    spx[i] = (mouseX - x[i]) * speedRate[i];
    spy[i] = (mouseY - y[i]) * speedRate[i];
    x[i] += spx[i];
    y[i] += spy[i];
    
    drawBug(i);
  }
}

void drawBug(int i) {
  pushMatrix();
  
  translate(x[i], y[i]);
  rotate(atan2(mouseY - y[i], mouseX - x[i])); // 向きをマウスの方に向ける
  
  noStroke();
  rectMode(CENTER);
  fill(12, 50, 99);
  rect(0, 0, 10, 5);
  fill(20);
  rect(5, 0, 5, 5);
  
  popMatrix();
}
