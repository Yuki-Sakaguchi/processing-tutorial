float x;
float y;

void setup() {
  size(800, 600);
  background(0);
  frameRate(60);
  x = width / 2.0;
  y = height / 2.0;
}

void draw () {
  stroke(255);
  noFill();
  point(x, y);
  x = x + random(-4, 4);
  y = y + random(-4, 4);
}
