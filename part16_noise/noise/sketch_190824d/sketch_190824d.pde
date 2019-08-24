float myNoise = 0.0;
float start = 0.0;
float step = 0.02;
float R = 200;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  background(255);
  myNoise = start;
  
  translate(width/2, height/2);
  
  for (int p = 0; p < 360; p++) {
    float length = noise(myNoise) * R;
    line(length * cos(radians(p)), length * sin(radians(p)), 0, 0);
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
