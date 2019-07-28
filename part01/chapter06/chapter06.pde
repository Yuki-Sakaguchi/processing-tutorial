// setup(), draw()のどちらからも参照する変数はグローバルに定義
int locationX; // 現在のX座標 
int direction; // 移動の向き（1 or -1）

// 初めの一回だけ設定すればいいものはsetupで行う
void setup() {
  size(800, 600);
  frameRate(60);
  fill(0, 127, 255);
  noStroke();
  
  locationX = 0;
  direction = -1;
}

void draw() {
  background(0); // 毎回背景を黒に塗ることで１フレーム前を初期化
  ellipse(locationX, height/2, 20, 20);
  
  // 現在の向きに10移動した場所を新たな座標として代入
  locationX = locationX + 10 * direction;
  
  // もしX座標が０より小さいか画面幅より大きくなれば向きを変える
  if (locationX < 0 || locationX > width) {
    direction *= -1;
  }
}
  
