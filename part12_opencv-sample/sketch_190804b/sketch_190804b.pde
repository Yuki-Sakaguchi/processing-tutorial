/**
 * 背景差分で赤い残像を作る
 */
import processing.video.*;

Capture cam;

PImage bg;

void setup() {
  size(640, 480);
  
  String[] cameras = Capture.list();
  for (int i = 0; i < cameras.length; i++) {
    println("[" + i + "] " + cameras[i]);
  }
  
  cam = new Capture(this, cameras[3]);
  cam.start();
  bg = get(0, 0, 640, 480);
}

void draw() {
  image(cam, 0, 0);
  cam.loadPixels();
  bg.loadPixels();
  
  for (int i = 0; i < cam.pixels.length; i++) {
    float y1 = 0.299 * red(cam.pixels[i]) + 0.587 * green(cam.pixels[i]) + 0.114 * blue(cam.pixels[i]);
    float y2 = 0.299 * red(bg.pixels[i]) + 0.587 * green(bg.pixels[i]) + 0.114 *  blue(bg.pixels[i]);
    float d = abs(y1 - y2);
             
    if (d > 30) {
      cam.pixels[i] = color(255, 0, 0);
    }
  }
  
  cam.updatePixels();
  image(cam, 0, 0);
  
  bg = get(0, 0, 640, 480);
}

void captureEvent (Capture c) {
  c.read();
}
