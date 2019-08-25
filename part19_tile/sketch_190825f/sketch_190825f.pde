color[] col = {
  color(0),
  color(0, 36, 146),
  color(0, 130, 146),
  color(170, 207, 190),
  color(219, 52, 89)
};

int step = 15;

void setup() {
  size(500, 500);
  background(col[0]);
  noStroke();
  noLoop();
}

void draw() {
  float boxSize = width/step;
  for (float y = 0; y < height; y += boxSize) {
    for (float x = 0; x < width; x += boxSize) {
      pushMatrix();
      translate(x, y);
      
      // 背景
      color c = random(2) > 1 ? col[0] : col[1];
      fill(c);
      rect(0, 0, boxSize, boxSize);
      
      // オブジェクト
      switch((int)random(4)) {
        case 1:
          float s = random(10, boxSize);
          fill(col[2]);
          ellipse(boxSize/2, boxSize/2, s, s);
          break;
        case 2:
          int r = (int)random(2);
          fill(col[r > 0 ? 1 : 3]);
          triangle(0, 0, boxSize, boxSize/2, 0, boxSize);
          break;
        case 3:
          fill(col[4]);
          triangle(boxSize/2, boxSize/4, boxSize, boxSize, 0, boxSize);
          break;
        default:
          break;
      }
      
      popMatrix();
    }  
  }
}

void mousePressed() {
  redraw();
}

void keyPressed(){
  if (key == ' ') {
    saveFrame("####.png");
  }
}
