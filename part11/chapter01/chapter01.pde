// 輪郭抽出
import gab.opencv.*;
import processing.video.*;

OpenCV opencv; // OpenCVのインスタンス
Capture video; // カメラ用インスタンス
ArrayList<Contour> contours; // 輪郭

void setup () {
  size(640, 480);
  frameRate(60);
  
  // OpenCVとカメラを初期化
  opencv = new OpenCV(this, 640, 480);
  video = new Capture(this, 640, 480);
  video.start();
}

void draw () {
  opencv.loadImage(video);
  
  // 閾値の設定
  int threshold = int(map(mouseX, 0, width, 0, 100));
  opencv.threshold(threshold);
  contours = opencv.findContours(); // 設定した閾値を適用
  
  // 輪郭を描く
  noFill();
  strokeWeight(2);
  background(0);
  for (int i = 0; i < contours.size(); i++) {
    stroke(255);
    contours.get(i).draw();
  }
}

void captureEvent (Capture c) {
  c.read();
}
