float angle = 0.0;
float R = 116;

void setup(){
  size(500, 500);
  background(0);
  stroke(255);
  strokeWeight(10);
}
 
void draw(){
  background(0);
  
  float step = 80;
  for (float y = 0; y < height; y += step) {
    for (float x = 0; x < width; x += step) {
      pushMatrix();
      translate(x, y);
      rotate(0.32);
      float len = cos(angle) * R;
      line(0, -len, 0, len);
      popMatrix();
    } 
  }
  
  angle += 0.02;
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
