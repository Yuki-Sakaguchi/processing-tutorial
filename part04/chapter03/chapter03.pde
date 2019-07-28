PImage img;

void setup() {
  size(800, 600);
  stroke(255);
  img = loadImage("sample.jpg");
  img.resize(width, height);
}

void draw() {
  background(0);
  noStroke();
  int step = int(map(mouseX, 0, width, 1, 100)); // マウスの横位置に応じてstepを増減
  for (int j = 0; j < height; j += step) {
    for (int i = 0; i < width; i += step) {
      color col = img.get(i, j);
      fill(col);
      rect(i, j, step, step);
    }
  }
}
