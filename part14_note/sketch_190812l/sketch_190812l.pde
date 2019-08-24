// https://note.mu/outburst/n/n5dd77ef285f8
import processing.opengl.*;

void setup() {
  size(800, 600, OPENGL);
  pixelDensity(2);
  noFill();
  noLoop();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  translate(width/3, height/3, -450);
  rotateY(radians(-18));
  divideRect(0, 0, width, width, 8);
  pushMatrix();
  rotateY(radians(-90));
  divideRect(0, 0, width, width, 8);
  popMatrix();
  rotateX(radians(90));
  divideRect(0, 0, width, width, 8);
}

void mousePressed() {
  redraw();
}

void divideRect(float x, float y, float w, float h, int n) {
  float randw = random(w); 
  float randh = random(h);
  if (n>0) {
    n--;
    if (w>h) {
      divideRect(x, y, randw, h, n);
      divideRect(x+randw, y, w-randw, h, n);
      if (n==0) {
        randomShape(x, y, randw, h);
        randomShape(x+randw, y, w-randw, h);
      }
    } else {
      divideRect(x, y, w, randh, n);
      divideRect(x, y+randh, w, h-randh, n);
      if (n==0) {
        randomShape(x, y, w, randh);
        randomShape(x, y+randh, w, h-randh);
      }
    }
  }
}

void randomShape(float _x, float _y, float _w, float _h) {
  stroke(0);
  float r = random(1);
  if (r > 0.75) {
    fill(#F01B1B);
  } else if (r > 0.50) {
    fill(#930606);
  } else if (r > 0.25) {
    fill(#F06F1F);
  } else if (r > 0.20) {
    fill(#73D1E0);
  } else {
    fill(360);
  }
  rect(_x, _y, _w, _h);
}
