/**
 * 回転する円がblendModeによって面白い映像になる
 */

void setup () {
  size(600, 600);
  blendMode(DIFFERENCE);
}

void draw() {
  clear();
  for (int i = 4; i < 15; i++) {
    float r = i * frameCount * 0.02 % TWO_PI;
    ellipse(width/2 + i * 10.0 * cos(r), height/2 + i * 10.0 * sin(r), i * 50.0, i * 50.0);
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
