/**
 * キー入力で画面にテキストをカラフルに表示
 */
void setup () {
  size(400, 400);
  colorMode(HSB, 100);
  background(99);
  frameRate(60);
}

void draw () {
  if (keyPressed) {
    fill(random(100), 99, 99, 80);
    text(key, random(width), random(height));
  }
}

void keyPressed () {
  switch(key) {
    case ' ':
      background(99);
      break;
  }
}
