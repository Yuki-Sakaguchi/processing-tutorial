// https://note.mu/outburst/n/n5528bf082224
int count = 15;
int actRandomSeed = (int)random(100000);
void setup() {
  size(840, 840, OPENGL);
  pixelDensity(2);
}

void draw() {
  randomSeed(actRandomSeed);
  background(#FAE1E6);
  boxes();
  steps(0, height, width / (count+3), height / (count+3), count);
  pins();
  powder();
}

void boxes() {
  for (int i = 0; i < 10; i ++) {
    push();
    noFill();
    fill(getCol());
    stroke(getCol());
    strokeWeight(1);
    translate(random(width), random(height), -100);
    rotateX(random(TAU));
    rotateY(random(TAU));
    rotateZ(random(TAU));
    box(random(10, 100));
    pop();
  }
}

void powder() {
  for (int i = 0; i < 800000; i ++) {
    stroke(getCol(), 30);
    strokeWeight(0.6);
    point(random(width), random(height));
  }
}

void steps(float x, float y, float w, float h, int n) {
  noStroke();
  for (int i = 1; i < n+1; i ++) {
    fill(getCol());
    stroke(getCol());
    rect(x, y - h * i, w, h);
  }
  n--;
  if (n >= 0) {
    steps(x + w, y, w, h, n);
  }
}

void pins() {
  noFill();
  for (int i = 0; i < 20; i ++) {
    float d = random(5, 100);
    push();
    stroke(getCol());
    strokeWeight(random(1, 4));
    translate(random(width), random(height), random(-10, 10));
    circle(0, 0, d);
    line(0, height, 0, d/2);
    pop();
  }
}

int[] colors = {#dd7373, #3b3561, #ead94c, #d1d1d1, #51a3a3, #F7AA61};
int getCol() {
  return colors[(int)random(colors.length)];
}

void mousePressed() {
  actRandomSeed = (int)random(100000);
}

void keyPressed() {
  if (key == 's')saveFrame("####.png");
}
