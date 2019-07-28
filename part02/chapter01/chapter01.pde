int NUM = 10000;
float[] x = new float[NUM];
float[] y = new float[NUM];

void setup() {
  size(800, 600, P2D);
  frameRate(60);
  background(0);
  
  // 全ての要素の初期位置は画面の真ん中
  for (int i = 0; i < NUM; i++) {
    x[i] = width / 2.0;
    y[i] = height / 2.0;
  }
}

void draw() {
  stroke(255);
  noFill();
  blendMode(ADD);
  
  // 点を描画し、現在地からランダムで少し動かしたところの座標を保存
  for (int i = 0; i < NUM; i++) {
    point(x[i], y[i]);
    x[i] = x[i] + random(-2.0, 2.0);
    y[i] = y[i] + random(-2.0, 2.0);
  }
  
  // 画面サイズのうっすら黒い幕を重ねることで古いものは徐々に消えていく
  blendMode(BLEND);
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
}
