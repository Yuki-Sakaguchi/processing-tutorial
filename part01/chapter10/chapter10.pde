float angle = 0.0; // 回転角度

void setup() {
  size(800, 600);
  frameRate(60);
  fill(0, 127, 255);
  noStroke();
}

void draw() {
  background(0);
  
  pushMatrix(); // 座標を一時保存
  translate(width/4, height/4);
  rotate(angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix(); // 保存した座標を復元
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  rectMode(CENTER);
  rect(0, 0, 200, 200);
  popMatrix();
  
  // 角度を加算
  angle += 0.1;
}
