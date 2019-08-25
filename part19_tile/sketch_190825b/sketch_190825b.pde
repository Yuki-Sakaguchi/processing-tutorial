float step = 60;
int startCount = 0;
boolean isSave = false;
boolean isDraw = true;

void setup() {
  size(400, 400);
}

void draw() {
  if (!isDraw) {
    return;
  }
  isDraw = false;
  background(255);
  strokeWeight(4);
  for (float y = -step; y < height; y += (step/2)) {
    for (float x = -step; x < width; x += (step/2)) {
      pushMatrix();
      translate(x, y);
      fill(createColor());
      rotate(-PI/8);
      rect(0, 0, step/2, step);
      popMatrix();
    }
  }
  
  if (isSave) {
    startCount++;
    saveFrame("frames/####.png");
    if (startCount >= 100) {
      exit();
    }
  }
}

color createColor() {
  switch((int)random(4)) {
    case 1:
      return color(255, 0, 0);
    case 2:
      return color(255, 255, 255);
    case 3:
      return color(255, 255, 0);
    default:
      return color(0, 0, 255);
  }
}

void keyPressed() {
  if (key == ' ') {
    isDraw = true;
    saveFrame("####.png");
  }
}

void mousePressed() {
  isSave = true;
}
