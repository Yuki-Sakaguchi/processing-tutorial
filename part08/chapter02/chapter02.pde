import controlP5.*; // controlP5ライブラリを読み込む
ControlP5 cp5; // ContorolP5をcp5として宣言

Slider boxSize; // 立方体のサイズ
Slider2D rotate; // 回転スピード(x, y)
Toggle start; // スタート、ストップのトグルボタン
ColorWheel col; // カラー

void setup () {
  size(800, 600, P3D);
  
  cp5 = new ControlP5(this); // controlP5を初期化
  
  // スライダーを追加
  boxSize = cp5.addSlider("BOX SIZE")
    .setPosition(20, 20) // スライダーの位置
    .setRange(0, 400) // 最小値、最大値
    .setValue(100); // 初期値
    
  rotate = cp5.addSlider2D("ROTATE")
    .setPosition(20, 40)
    .setSize(100, 100) // スライダーの大きさ
    .setMinMax(1.0, 1.0, 10.0, 10.0) // 最小値１、最小値２、最大値１、最大値２
    .setValue(2.0, 2.0); // 初期値１、初期値２
    
  start = cp5.addToggle("START/STOP")
    .setPosition(20, 160)
    .setSize(20, 20)
    .setValue(true);
  
  col = cp5.addColorWheel("COLOR")
    .setPosition(20, 220)
    .setRGB(color(31, 128, 255));
}

void draw () {
  background(0);
  
  pushMatrix();
  lights(); // ライティングをONにする
  translate(width/2, height/2, 0);
  
  // ONの時だけ回転させる
  if (start.getState()) {
    rotateX(millis()/1000.0 * rotate.getArrayValue()[0]); // Slider2Dからの値を取得して使う
    rotateY(millis()/1000.0 * rotate.getArrayValue()[1]);
  }
  
  fill(col.getRGB()); // カラーパレットの色を反映
  noStroke();
  box(boxSize.getValue()); // Sliderからの値を取得して使う
  
  popMatrix();
}
