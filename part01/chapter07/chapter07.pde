float diameter;
float hue;

void setup() {
  size(800, 600);
  frameRate(60);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  background(0);
  
  // sin()でアニメーションの変化をつける
  diameter = 400 + sin(frameCount * 0.1) * 200;
  hue = sin(frameCount * 0.1) * 120;
  
  fill(hue, 20, 100);
  
  ellipse(width/2, height/2, diameter, diameter);
}
