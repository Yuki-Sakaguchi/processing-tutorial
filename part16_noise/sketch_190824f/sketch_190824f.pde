ArrayList<Float> yoff = new ArrayList<Float>();
float step = 0.05;
int stepY = 2;
float offset = 10;
int baseHeight = 150;
int startCount = 0;
boolean isSave = false;

void setup() {
  size(640, 390);
  
  for (int i = baseHeight; i < height; i += stepY) {
    float v = createRandom() + createRandom() + createRandom();
    yoff.add(v);
  }
}

void draw() {
  background(254, 221, 55);
  
  for (int i = 0; i < yoff.size(); i++) {
    int r = 0;
    float g = map((i * stepY) + baseHeight, 150, height, 146, 0);
    float b = map((i * stepY) + baseHeight, 150, height, 204, 45);
    fill(r, g, b);
    if (i % 15 == 0) {
      stroke(255);    
    } else {
      stroke(37, 55, 64);
    }
    beginShape();
    float _yoff = yoff.get(i);
    float xoff = 0.0;
    for (float x = -offset; x <= width; x += 10) {
      float y = map(noise(xoff, _yoff), 0, 1, (i * stepY) + baseHeight, (i * stepY) + baseHeight + 100);
      vertex(x, y);
      xoff += step;
    }
    vertex(width, height + offset);
    vertex(0, height + offset);
    endShape(CLOSE);
    yoff.set(i, yoff.get(i) + createRandom());
  }
  
  if (isSave) {
    startCount++;
    saveFrame("frames/####.png");
    if (startCount >= 100) {
      exit();
    }
  }
}

float createRandom() {
  return random(0.001, 0.2);
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}

void mousePressed() {
  isSave = true;
}
