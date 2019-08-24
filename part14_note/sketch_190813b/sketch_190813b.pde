float circleSize = 80;
float diameter = 100;
float strokeSize = 10;
float angle = 10;
float y = 0;

void setup() {
  size(640, 480);
  colorMode(HSB, 360, 100, 100);
  background(0);
}

void draw() {
  background(0);
  
  stroke(360);
  strokeWeight(strokeSize);
  fill(0);
  pushMatrix();
  translate(width/2, width/2);
  ellipse(0, 0, diameter*4, diameter);
  popMatrix();
  
  diameter--;
  strokeSize -= 0.2;
  if (diameter < 0) {
    diameter = 100;
  }
  if (strokeSize < 0) {
    strokeSize = 10; 
  }
  
  noStroke();
  fill(360);
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0, y - 40, circleSize, circleSize);
  popMatrix();
  
  circleSize = Math.abs(80 * sin(radians(angle)));
  y = Math.abs(40 * cos(radians(angle)));
  angle++;
}
