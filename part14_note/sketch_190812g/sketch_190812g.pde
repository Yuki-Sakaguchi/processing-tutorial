// https://note.mu/outburst/n/n2670170f9e5f
ArrayList<Circle> circles = new ArrayList<Circle>();

void setup() {
  size(840, 840);
  pixelDensity(2);
  noLoop();
  strokeWeight(0.5);
}

void draw() {
  background(#0B72B4);
  tile();
}

void tile() {
  int count = 15;
  float w = width/count;
  for (int j = 0; j < count; j++) {
    for (int i = 0; i < count; i++) {
      noFill();
      stroke(#ffffff);
      rect(i*w, j*w, w, w);
      
      noStroke();
      fill(#ffffff);
      circle(i*w+w/2, j*w+w/2, 3);
    }
  }

  for (int j = 0; j < count + 1; j++) {
    for (int i = 0; i < count + 1; i++) {
      if (random(1) > 0.5) {
        circles.add(new Circle(i*w, j*w, w));
      }
    }
  }
  for (Circle c : circles) {
    c.show();
  }
}

int[] colors = {#08415C, #CC2936, #6B818C, #F1BF98, #EEE5E9};
int getCol() {
  return colors[(int)random(colors.length)];
}

void mousePressed() {
  redraw();
  circles.clear();
}

void keyPressed(){
  if(key == 's')saveFrame("####.png");
}

//----------------------------------------------------------------

class Circle {
  float x;
  float y;
  float d;
  float count;
  Circle(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
    count = random(0.1, 0.5);
  }

  void show() {
    noFill();
    stroke(#ffffff);
    for (float i = 0; i < 1; i += count) {
      circle(x, y, d*i);
    }
    noStroke();
    fill(getCol());
    pushMatrix();
    translate(x, y);
    if (random(1) > 0.75) {
      circle(0, 0, d);
    } else if (random(1) > 0.50) {
      rotate(HALF_PI * (int)random(4));
      arc(0, 0, d, d, 0, HALF_PI, PIE);
    } else if (random(1) > 0.25) {
      rotate(HALF_PI * (int)random(4));
      arc(0, 0, d, d, 0, PI, PIE);
    } else {
      rotate(HALF_PI * (int)random(4));
      arc(0, 0, d, d, 0, HALF_PI + PI, PIE);
    }
    popMatrix();
  }
}
