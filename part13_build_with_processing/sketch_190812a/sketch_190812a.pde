/**
 * 前フレームとの差分を調べて、矩形を表示
 */
import processing.video.*;

Capture camera;
PImage pcamera;

void setup () {
  size(640, 480);
  frameRate(24);
  stroke(255);
  
  camera = new Capture(this, width, height, 15);
  camera.start();
  
  pcamera = new PImage(width, height);
}

void draw() {
  // pixel操作の準備
  pcamera.loadPixels();
  
  // 半透明にしてフェードアウト効果を作る
  tint(255, 64);
  
  // 今のカメラを画面に表示
  image(camera, 0, 0);
  
  for (int y = 0; y < height; y += 5) {
    for (int x = 0; x < width; x += 5) {
      int pos = (y * width) + x;
      
      // １フレーム前の画像から輝度を取得し、現在のフレームの輝度を比較
      float diff = abs(brightness(pcamera.pixels[pos]) - brightness(camera.pixels[pos]));
      
      // 差分が多い場合は資格を表示
      if (diff > 50) {
        fill(camera.pixels[pos]);
        rect(x, y, diff/5, diff/5);
      }
    }
  }
  
  // 現在のカメラの画像をpcameraに保存し、次の比較で使う
  pcamera.copy(camera, 0, 0, width, height, 0, 0, width, height);
}

void captureEvent(Capture camera) {
  camera.read(); 
}
