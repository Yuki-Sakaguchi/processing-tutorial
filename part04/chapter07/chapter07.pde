ArrayList<Bubble> bubbles;
PImage img;
int maxSize = 60;

void setup() {
  size(800, 600);
  frameRate(60);
  noStroke();
  
  bubbles = new ArrayList<Bubble>();
  
  img = loadImage("sample.jpg");
  img.resize(width, height);
  
  for (int i = 0; i < 10; i++) {
    PVector loc = new PVector(random(width), random(height));
    bubbles.add(new Bubble(loc));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < bubbles.size(); i++) {
    bubbles.get(i).draw();
  }
  
  for (int i = 0; i < bubbles.size(); i++) {
    if (bubbles.get(i).isDead == false) {
      boolean expand = bubbles.get(i).checkPixel();
      if (expand == false) {
        PVector loc;
        while (true) {
          loc = new PVector(random(width), random(height));
          color c = get(int(loc.x), int(loc.y));
          if ((red(c) + green(c) + blue(c)) == 0) {
            break;
          }
        }
        bubbles.add(new Bubble(loc));
        bubbles.get(i).isDead = true;
      }
    }
  }
}

void mouseClicked() {
  bubbles.clear();
  for (int i = 0; i < 10; i++) {
    PVector loc = new PVector(random(width), random(height));
    bubbles.add(new Bubble(loc));
  }
}

class Bubble {
  float size;
  float expandSpeed;
  color circleColor;
  PVector location;
  boolean expand;
  boolean isDead;
  
  Bubble(PVector _location) {
    location = _location;
    size = 0;
    expandSpeed = 4.0;
    expand = true;
    isDead = false;
    circleColor = img.get(int(location.x), int(location.y));
  }
  
  void draw() {
    if (expand == true) {
      size += expandSpeed;
    }
    fill(circleColor);
    ellipse(location.x, location.y, size, size);
  }
  
  boolean checkPixel() {
    float nextSize = size + expandSpeed;
    for (float i = 0; i < TWO_PI; i += 0.01) {
      int x = int(cos(i) * nextSize / 2.0 + location.x);
      int y = int(sin(i) * nextSize / 2.0 + location.y);
      color c = get(x, y);
      if ((red(c) + green(c) + blue(c)) > 0 || size > maxSize) {
        expand = false;
      }
    }
    return expand;
  }
}
