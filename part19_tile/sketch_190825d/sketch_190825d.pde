float angle = 0.0;
float R = 20;

boolean isSave = false;
int startCount = 0;

color bg = color(4, 16, 38);
color[] col = {
  color(255, 195, 1),
  color(248, 234, 223),
  color(46, 129, 135),
  color(164, 7, 96),
  color(55, 218, 213),
  color(227, 1, 109)
};

void setup(){
  size(500, 500);
  background(bg);
  strokeWeight(6);
}
 
void draw(){
  background(bg);
  
  float step = 40;
  for (float y = 0; y < height; y += step) {
    for (float x = 0; x < width; x += step) {
      pushMatrix();
      stroke(col[(int)random(col.length)]);
      translate(x, y);
      rotate(0.80);
      float len = cos(angle) * R;
      line(0, -len, 0, len);
      popMatrix();
    } 
  }
  
  angle += 0.02;
  
  if (isSave) {
    startCount++;
    saveFrame("frames/####.png");
    if (startCount >= 100) {
      exit();
    }
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
