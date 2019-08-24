/**
 * 円型でくり抜く壁を３つ重ねて面白い図形にする
 */
ArrayList <PVector> circles;

void setup() {
  size(800, 600);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100);
  noLoop();
  noStroke();
}

void draw() {
  background(360);
  for(int i = 0 ; i < 3; i ++){
    fill(random(360), 70, 85);
    hole();
  }
}

void hole(){
  circles = new ArrayList <PVector>();

  addCircle();
  beginShape();
  vertex(0, 0);
  vertex(0, height);
  vertex(width, height);
  vertex(width, 0);

  for (int i=0; i<circles.size(); i++) {
    PVector p = circles.get(i);
    beginContour();
    for (float t = 0; t < TWO_PI; t+= TWO_PI/360) {
      float x = p.x + p.z  * cos(t);
      float y = p.y + p.z  * sin(t);
      vertex(x, y);
    }
    endContour();
  }
  endShape();
}

void addCircle() {
  while (circles.size() < 30) {
    float diameter = random(10, 200);
    PVector c = new PVector(random(width), random(height), diameter);
    boolean overlapping = false;
    
    //円が重なっているかどうかの判定
    for (PVector p : circles) {
      if (dist(c.x, c.y, p.x, p.y) < (c.z + p.z)) {
        overlapping = true;
        break;
      }
    }
    if (!overlapping) {
      circles.add(c);
    }
  }
}

void mousePressed() {
  redraw();
}

void keyPressed(){
  if(key == ' '){saveFrame("####.png");}
}
