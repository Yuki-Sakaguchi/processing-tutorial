import fisica.*; // Fisicaライブラリのインポート
FWorld world; // FWorldの宣言

void setup () {
  size(800, 600);
  frameRate(60);
  
  Fisica.init(this); // Fisicaを初期化
  world = new FWorld(); // FWorldを初期化
  world.setEdges(); // 上下左右に壁を生成する
}

void draw () {
  background(255);
  world.step(4.0 / 60.0); // スピードを設定して物理計算を実行
  world.draw(this); // 物体を描画する
}

void mouseReleased () {
  float width = random(10, 80);
  float height = random(10, 80);
  
  // 新規に矩形を生成して、インスタンスを生成
  FBox box = new FBox(width, height);
  box.setPosition(mouseX, mouseY);
  box.setRestitution(0.6); // 反発力を0.6にする
  box.setFill(31, 127, 255);
  box.setStroke(31);
  world.add(box); // Fisicaに追加
}
