float angle = 0.0; // 回転角度

void setup() {
  size(800, 600);
  frameRate(60);
  fill(0, 127, 255);
  noStroke();
}

void draw() {
  background(0);
  
  // 原点(0, 0)を中心に座標前提を回転させる
  rotate(angle);
  
  // 四角形の中心を基準点に300, 300の四角形を描画
  rectMode(CENTER);
  rect(400, 300, 300, 300);
  
  // 角度を加算
  angle += 0.1;
}
