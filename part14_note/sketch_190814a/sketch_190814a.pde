int vertexNum = 3;
int MIN = 3;
int MAX = 10;
int angle = 1;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);

  // 中心線
  strokeWeight(1);
  stroke(200);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  // 正六角形
  noFill();
  strokeWeight(2);
  stroke(200, 0, 0);
  drawPolygon(width/2, height/2, 150, vertexNum);  // 横の位置、縦の位置、中心点と頂点までの距離、頂点数
}

void drawPolygon(int x, int y, int r, int vertexNum) {
  pushMatrix();
  translate(x, y);
  beginShape();
  for (int i = 0; i < vertexNum; i++) {
    vertex(r*cos(radians(360*i/vertexNum)), r*sin(radians(360*i/vertexNum)));
  }
  endShape(CLOSE);
  popMatrix();
}

void mousePressed () {
  vertexNum++;
  if (vertexNum >= MAX) {
    vertexNum = MIN;
  }
}
