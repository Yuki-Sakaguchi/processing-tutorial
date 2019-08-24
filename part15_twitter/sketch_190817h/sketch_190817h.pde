/**
 * 格子状に敷き詰められた矩形がキラキラと大きさを変える
 */

float[] p;

void setup() {
  size(800, 800);
  p = new float[width];
}

void draw() {
  clear();
  rectMode(CENTER);
  float size = width/10/2;
  for (int i = 0; i < width; i++) {
    p[i] = p[i] > 0 ? p[i] < size ? p[i] + size/20 : 0 : random(1) < 0.1 ? 0.1 : 0;
    rect(i % size * size + 5, i / size * size + 5, p[i], p[i]);
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
