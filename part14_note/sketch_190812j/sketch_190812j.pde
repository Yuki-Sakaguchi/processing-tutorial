// https://note.mu/outburst/n/n7365bf93f622
int actRandomSeed = 0;
int posZ = 0;

void setup() {
  size(800, 800, OPENGL);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  randomSeed(actRandomSeed);
  background(360);

  translate(width/2, height/2, posZ);
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateX(map(mouseY, 0, width, 0, PI));
  drawBranch(250, 5, 11);
}

void drawBranch(float len, float w, int n) {
  float step = 0.9;
  float angle = PI * 0.5;
  fill(200, random(100), random(100));
  box(w, w, len);
  
  pushMatrix();
  translate(0, 0, len*0.5);
  sphere(w * 2);
  
  translate(0, 0, -len);
  sphere(w * 2);
  popMatrix();
  
  w *= 0.9;
  n--;

  if (n > 0) {
    pushMatrix();
    translate(0, 0, len/2 + w/2);
    if (random(1) > 0.5)rotateY(angle);
    else rotateX(angle);
    
    drawBranch(len * step, w, n);
    popMatrix();

    pushMatrix();
    translate(0, 0, -len/2 - w/2);
    if (random(1) > 0.5)rotateY(angle);
    else  rotateX(angle);
    drawBranch(len * step, w, n);
    popMatrix();
  }
}

void mousePressed() {
  actRandomSeed = (int)random(100000);
}

void keyPressed(){
  if(key == 's')saveFrame("####.png");
  
  if(keyCode == UP)posZ += 30;
  if(keyCode == DOWN)posZ -= 30;
}
