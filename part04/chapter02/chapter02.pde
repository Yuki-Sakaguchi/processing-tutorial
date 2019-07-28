PImage img;

void setup() {
  size(800, 600);
  stroke(255);
  img = loadImage("sample.jpg");
  img.resize(width, height);
}

void draw() {
  background(0);
  image(img, 0, 0);
  
  color col = img.get(mouseX, mouseY);
  fill(col);
  ellipse(50, 50, 80, 80);
  
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}
