import processing.video.*;
Capture cam; // カメラ用の定義

void setup () {
  size(853, 480);
  frameRate(60);
  noStroke();
  cam = new Capture(this); // カメラを初期化
  cam.start(); // キャプチャを開始する
}

void draw () {
  background(0);
  image(cam, 0, 0, width, height); // カメラの画像を描画する
}

// カメラのフレームが更新された時に実行される処理
void captureEvent (Capture c) {
  cam.read();
}
