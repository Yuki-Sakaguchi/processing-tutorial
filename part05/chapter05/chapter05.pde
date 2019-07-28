import processing.video.*;
Capture cam;

void setup () {
  size(853, 480);
  frameRate(60);
  noStroke();
  cam = new Capture(this);
  cam.start();
}

void draw () {
  background(0);
  int skip = 20;
  for (int j = skip/2; j < height; j += skip) {
    for (int i = skip/2; i < width; i += skip) {
      color col = cam.get(i, j);
      float br = brightness(col);
      fill(col);
      ellipse(i, j, skip * br / 255.0, skip * br / 255.0);
    }
  }
}

void captureEvent (Capture c) {
  cam.read();
}
