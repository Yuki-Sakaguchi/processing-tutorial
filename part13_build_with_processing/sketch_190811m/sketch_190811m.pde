/**
 * マウスのドラッグアンドドロップでサークルを作る
 * チャージすればするほど大きくなる
 */
int len = 20;
float[] x = new float[len];
float[] y = new float[len];
float[] ang = new float[len];
float[] rot = new float[len];
float[] c = new float[len];
float[] radius = new float[len];

float cx, cy;
float power = 0;
float maxPower = 200;

void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  background(99);
  frameRate(30);
}

void draw() {
  fadeToWhite();
  
  if (power > 0) {
    for (int i = 0; i < len; i++) {
      ang[i] += rot[i] * (power / 10);
      x[i] = cx + (power * sin(radians(ang[i])));
      y[i] = cy + (power * cos(radians(ang[i])));
      noStroke();
      fill(c[i], 80, 100, min(power, 80));
      ellipse(x[i], y[i], radius[i], radius[i]);
    }
  }
  
  if (mousePressed) {
    cx = mouseX;
    cy = mouseY;
    if (power < maxPower) {
      power += 1;
    } else {
      if (power > 1) {
        power = power * 0.98;
      } else {
        power = 0;
      }
    }
  }
}

void fadeToWhite() {
  noStroke();
  fill(99, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void mousePressed() {
  power = 0;
  for (int i = 0; i < len; i++) {
    radius[i] = random(10, 30);
    c[i] = random(100);
    rot[i] = random(-5, 5);
  }
}
