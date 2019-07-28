PImage img;

void setup() {
  size(800, 600);
  img = loadImage("sample.jpg");
  img.resize(width, height);
  background(0);
}

void draw() {
  noStroke();
  rectMode(CENTER);
  for (int i = 0; i < 150; i++) {
    PVector location = new PVector(random(width), random(height));
    color col = img.get(int(location.x), int(location.y));
    fill(col, 15);
    float brightness = red(col) + green(col) + blue(col);
    float angle = map(brightness, 0, 255*3, -PI*2.0, PI*2.0);
    float length = map(brightness, 0, 255*3, 0, 40);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, length, 2);
    popMatrix();
  }
}
