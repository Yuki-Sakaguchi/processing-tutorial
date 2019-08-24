/**
 * 回転する円が重なり色の差分で面白い動きを作るアニメーション
 */
 
float t;
 
void setup () {
  size(800, 800);
  background(0);
  blendMode(DIFFERENCE);
}

void draw() {
  clear();
  translate(width/2, height/2);
  for (int i = 1; i < 25; i++) {
    rotate(PI/12);
    fill(0, 255, 255);
    ellipse(0, 0, i * 30 * sin(t + PI/12 * i), i * 30);
  }
  t += PI/64;
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
