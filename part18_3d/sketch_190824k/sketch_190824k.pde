ArrayList<RectBox> boxList = new ArrayList<RectBox>();
float speed = 1;
int step = 11;
int groupCount = 6;
int startCount = 0;
boolean isSave = false;

void setup() {
  size(500, 500, P3D);
  
  background(255);
  noFill();
  stroke(0);
  strokeWeight(1);
  
  for (int i = 0; i < step; i++) {
    for (int j = 0; j < groupCount; j++) {
      RectBox r = new RectBox();
      r.size = 15 * i;
      r.angle = 4 * j;
      r.direction = i % 3;
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
  
  camera(width/2.0, height/4.0, (height/2) / tan(PI*30.0 / 180.0),
        width/2, height/1.2, 0,
        0, 1, 0);
  
  if (isSave) {
    startCount++;
    saveFrame("frames/####.png");
    if (startCount >= 300) {
      exit();
    }
  }
}

class RectBox {
  float size, angle;
  int direction;
  
  void update () {
    angle += speed;  
  }
  
  void draw () {
     pushMatrix();
     translate(width/2, height/2, width/2);
     switch (direction) {
       case 1:
         rotateY(radians(angle));
         break;
       case 2:
         rotateZ(radians(angle));
         break;
       default:
         rotateX(radians(angle));
         break;
     }
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
