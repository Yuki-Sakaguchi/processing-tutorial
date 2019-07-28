import processing.video.*;
Capture cam;
float scanHeight;
float scanSpeed;

void setup () {
  size(853, 480);
  frameRate(60);
  noStroke();
  cam = new Capture(this);
  cam.start();
  
  // スキャンの位置とスピードを初期化
  scanHeight = 0.0;
  scanSpeed = 4.0;
  background(0);
}

void draw () {
  // 指定した高さの横１行だけスキャンする
  for (int i = 0; i < width; i++) {
    color col = cam.get(i, int(scanHeight));
    fill(col);
    rect(i, scanHeight, 1, scanSpeed);
  }
  // スキャンする場所が下端まできたら０にリセット
  if (scanHeight > height) {
    scanHeight = 0; 
  }
}

void captureEvent (Capture c) {
  cam.read();
  scanHeight += scanSpeed; // スキャンする行を移動する
}
