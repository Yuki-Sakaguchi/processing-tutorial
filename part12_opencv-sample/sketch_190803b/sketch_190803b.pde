/**
 * 境界線を赤くする
 */
import gab.opencv.*;
import processing.video.*;

Capture video;
OpenCV cv;

void setup() {
  // 画面サイズ
  size(720, 480);
  // 動画の読み込み
  video = new Capture(this, width, height);
  cv = new OpenCV(this, 720, 480);
  // 背景差分の初期設定
  cv.startBackgroundSubtraction(5, 3, 0.5);
  video.start();
}

void draw() {
  image(video, 0, 0);  
  cv.loadImage(video);
  // 背景データの更新
  cv.updateBackground();
  cv.dilate();
  cv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  // 移動物体の輪郭を赤く塗る
  for (Contour contour : cv.findContours()) {
    contour.draw();
  }
}

// 動画イベント
void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
