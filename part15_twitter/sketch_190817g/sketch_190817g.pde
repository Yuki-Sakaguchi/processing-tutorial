/**
 * 花火のように円が大きく変わるアニメーション
 */

float d, t, s;

void setup () {
  size(800, 800); 
}

void draw() {
  clear();
  noStroke();
  noiseSeed(frameCount / 20);
  t = frameCount % 20 == 0 ? 0 : t + s;
  s = t == 0 ? 30 : s - 1;
  for (d = 0; d < TAU; d += 0.3) {
    circle(cos(d) * t + noise(1) * width, sin(d) * t + noise(9) * height, 20); 
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
