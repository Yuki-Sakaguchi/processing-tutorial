// https://note.mu/outburst/n/n458859bce090
int count;

void setup() {
  size(840, 840);
  pixelDensity(2);
  noLoop();
}

void draw() {
  background(getCol());
  int c = (int)random(3, 6);
  float s = width*1.5/c;
  for (int j = -1; j <= c; j++) {
    for (int i = -1; i < c; i++) {
      count = (int)random(2, 6);
      hexagon(i*s*cos(PI/6) + s/2*cos(PI/6), j*s*sin(PI/6)+s*sin(PI/6), s);
    }
  }
}

void hexagon(float x, float y, float s) {
  float hs = s/2;
  push();
  translate(x, y);
  rectRec(0, 0, hs * cos(radians(-30)), hs * sin(radians(-30)), 0, -hs, hs * cos(PI+radians(30)), hs * sin(PI+radians(30)), count);

  rectRec(0, 0, hs * cos(radians(-30)), hs * sin(radians(-30)), hs * cos(radians(30)), hs * sin(radians(30)), 0, hs, count);
  fill(0, 100);
  quad(0, 0, hs * cos(radians(-30)), hs * sin(radians(-30)), hs * cos(radians(30)), hs * sin(radians(30)), 0, hs);

  rectRec(0, 0, 0, hs, hs * cos(PI-radians(30)), hs * sin(PI-radians(30)), hs * cos(PI+radians(30)), hs * sin(PI+radians(30)), count);
  fill(0, 200);
  quad(0, 0, 0, hs, hs * cos(PI-radians(30)), hs * sin(PI-radians(30)), hs * cos(PI+radians(30)), hs * sin(PI+radians(30)));
  pop();
}

void rectRec(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int n) {
  stroke(0);
  fill(getCol());
  
  beginShape();
  vertex(x1, y1);
  vertex(x2, y2);
  vertex(x3, y3);
  vertex(x4, y4);
  endShape(CLOSE);

  n--;
  if (n >= 0) {
    float centerX = (((x1+x4)/2) + ((x2+x3)/2))/2;
    float centerY = (((y1+y2)/2) + ((y3+y4)/2))/2;
    float p = map(n, count-1, 0, 0, 0.7);

    if (random(1) > p) {
      rectRec(x1, y1, (x1+x2)/2, (y1+y2)/2, centerX, centerY, (x1+x4)/2, (y1+y4)/2, n);
    }
    if (random(1) > p) {
      rectRec((x1+x2)/2, (y1+y2)/2, x2, y2, (x2+x3)/2, (y2+y3)/2, centerX, centerY, n);
    }
    if (random(1) > p) {
      rectRec(centerX, centerY, (x2+x3)/2, (y2+y3)/2, x3, y3, (x3+x4)/2, (y3+y4)/2, n);
    }
    if (random(1) > p) {
      rectRec((x1+x4)/2, (y1+y4)/2, centerX, centerY, (x3+x4)/2, (y3+y4)/2, x4, y4, n);
    }
  }
}

int[]colors = {#1F271B, #19647E, #28AFB0, #F4D35E, #EE964B, #FF0004};
int getCol() {
  return colors[(int)random(colors.length)];
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 's')saveFrame("####.png");
}
