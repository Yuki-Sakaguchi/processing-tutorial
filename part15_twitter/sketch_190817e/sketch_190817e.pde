/**
 * 回転するカラフルな円。花火のようなネオンのような感じ
 */

float a, r, i, j;

void setup() {
  size(800, 800);
  colorMode(HSB);
  noStroke();
}

void draw() {
  clear();
  translate(width/2, height/2);
  r -= 0.1;
  for (j = 60; j < 360; j += 20) {
    for (i = 0; i < 80; i++) {
      a = TWO_PI / 80 * i;
      fill((j * 5) % 255, 200, 255);
      circle(sin(a) * j, cos(a) * j, j / 20 * sin(r + j + i));
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
