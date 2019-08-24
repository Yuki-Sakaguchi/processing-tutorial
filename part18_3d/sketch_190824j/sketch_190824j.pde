ArrayList<RectBox> boxList = new ArrayList<RectBox>();
float speed = 1;
int step = 5;
int groupCount = 5;
int startCount = 0;
boolean isSave = false;

void setup() {
  size(500, 500, P3D);
  background(255);
  noFill();
  stroke(0);
  strokeWeight(1);
  for (int i = 0; i < (step * groupCount); i++) {
    for (int j = 0; j < groupCount; j++) {
      RectBox r = new RectBox();
      r.size = 50 * i;
      r.angle = 0.1 * j;
      boxList.add(r);
    }
  }
}

void draw() {
  background(255);
  for (RectBox r : boxList) {
    r.update();
    r.draw();
  }
  
  if (isSave) {
    startCount++;
    saveFrame("frames/####.png");
    if (startCount >= 100) {
      exit();
    }
  }
}

class RectBox {
  float size, angle;
  
  void update () {
    angle += speed;  
  }
  
  void draw () {
     pushMatrix();
     translate(width/2, height/2, width/2);
     rotateY(radians(angle));
     box(size, size, size); 
     popMatrix();
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}

void mousePressed() {
  isSave = true;
}
