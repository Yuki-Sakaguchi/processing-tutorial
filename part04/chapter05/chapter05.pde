PImage img;

void setup() {
  size(800, 600);
  img = loadImage("sample.jpg");
  img.resize(width, height);
  background(0);
}

void draw() {
  noStroke();
  for (int i = 0; i < 40; i++) {
    PVector location = new PVector(random(width), random(height));
    color col = img.get(int(location.x), int(location.y));
    fill(col, 127);
    float brightness = red(col) + green(col) + blue(col);
    float diameter = map(brightness, 0, 255 * 3, 0, 20);
    ellipse(location.x, location.y, diameter, diameter);
  }
}
