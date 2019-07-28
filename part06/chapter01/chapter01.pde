import processing.sound.*; // Soundライブラリを読み込む
SoundFile soundfile; // サウンドプレイや

void setup () {
  size(800, 800);
  
  // サウンドファイルを読み込んで初期化する
  // ファイル名は読み込んだサウンドファイル名に変更する
  soundfile = new SoundFile(this, "sample.mp3");
  soundfile.loop(); // ループ再生する
}

void draw () {
  background(0);
  
  // マウスのx座標でパン
  soundfile.pan(map(mouseX, 0, width, -1.0, 1.0));
  
  // マウスのy座標で再生スピード変更
  soundfile.rate(map(mouseY, 0, height, 0.25, 4.0));
  
  // マウスの位置を交差する線で表示
  noFill();
  stroke(255);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}
