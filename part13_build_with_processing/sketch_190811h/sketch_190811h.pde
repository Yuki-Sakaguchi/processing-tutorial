/**
 * マウスの位置に応じて色と大きさの違う円を生成
 */
int maxColor;

void setup () {
  size(600, 600);
  maxColor = width;
  colorMode(HSB, maxColor);
  background(maxColor - 1);
  noStroke();
  frameRate(24);
}

void draw () {
  fill(mouseX, maxColor * 0.5, maxColor);
  ellipse(mouseX, mouseY, mouseY/2, mouseY/2);
}
