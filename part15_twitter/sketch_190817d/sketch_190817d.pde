/**
 * 円の重なりによって境界線が波を打つ円を作り出す
 */

void setup () {
  size(600, 600);
  colorMode(HSB);
  noStroke();
  blendMode(ADD);
}

void draw () {
  clear();
  fill(frameCount % 360, 100, 100);
  for (int i = 0; i < 4; ++i) {
    float t = TWO_PI * i/4 + frameCount/60f;
    circle(width/2 + 10 * cos(t), height/2 + 10 * sin(t), 300);
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
