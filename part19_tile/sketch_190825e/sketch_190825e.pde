float angle = 0.0;
float R = 20;
float step = 50;

ArrayList<Line> lineList = new ArrayList<Line>();
color bg = color(4, 16, 38);
color[] col = {
  color(255, 195, 1),
  color(248, 234, 223),
  color(46, 129, 135),
  color(164, 7, 96),
  color(55, 218, 213),
  color(227, 1, 109)
};

boolean isSave = false;
int startCount = 0;

void setup(){
  size(500, 500);
  background(bg);
  strokeWeight(6);
  
  for (float y = -step; y < height; y += step) {
    for (float x = -step; x < width; x += step) {
      Line l = new Line();
      l.x = x;
      l.y = y;
      l.rotate = 0.8;
      l.angle = 1.55;
      l.col = col[(int)random(col.length)];
      lineList.add(l);
    } 
  }
}
 
void draw(){
  background(bg);
  
  for (int i = 0; i < lineList.size(); i++) {
    lineList.get(i).draw();
  }
  
  if (isSave) {
    startCount++;
    saveFrame("frames/####.png");
    if (startCount >= 300) {
      exit();
    }
  }
}

class Line {
  float x, y, angle, rotate;
  color col;
  
  Line () {
    angle = 1.55;
  }
  
  void draw () {
    // angle = map(dist(x, y, mouseX, mouseY), 0, width, 1.55, 3.1);
    angle = map(dist(x, 0, mouseX, 0), 0, width, 0, 5);
    pushMatrix();
    translate(x, y);
    stroke(col);
    rotate(rotate);
    float len = cos(angle) * R;
    line(0, -len, 0, len);
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
