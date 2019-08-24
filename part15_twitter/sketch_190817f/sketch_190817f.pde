/**
 * 一定時間ごとに加速して真っ直ぐな軌道の残像を残す円
 */
 
float [] x = new float[32];
float [] y = new float[32];
float [] targetX = new float[32];
float [] targetY = new float[32];

void setup() {
  size(800, 800);
  fill(252, 32);
}

void draw() {
  noStroke();
  rect(0, 0, width, height); // フェード用
  
  stroke(0);
  strokeWeight(8);
  for (int i = 0; i < 32; i++) {
    // 一定のタイミングで目的にを変更
    if (frameCount % 60 == 0) {
      targetX[i] = random(width);
      targetY[i] = random(height);
    }
    
    // 異動前の位置（現在地）を保存
    float previousX = x[i];
    float previousY = y[i];
    
    // 移動後の位置を取得（今の位置から目標の位置を引く）
    float nextX = x[i] + (targetX[i] - x[i]) / 4;
    float nextY = y[i] + (targetY[i] - y[i]) / 4;
    
    // 移動の軌道を描く
    line(previousX, previousY, nextX, nextY);
    
    // 現在の位置を移動後の位置で更新
    x[i] = nextX;
    y[i] = nextY;
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
