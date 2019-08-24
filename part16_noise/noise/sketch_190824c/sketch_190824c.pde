float myNoise = 0.0;
float start = 0.0;
float step = 0.02;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  myNoise = start;
  
  for (int x = 0; x < width; x += 3) {
    float y = noise(myNoise) * height;
    line(x, 0, x, y);
    myNoise += step;
  }
}

void mousePressed() {
  start = random(10);
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
