import processing.sound.*;
SoundFile soundfile;
Amplitude rms; // 音量解析

void setup () {
  size(800, 800);
  fill(0, 127, 255);
  noStroke();

  soundfile = new SoundFile(this, "sample.mp3");
  soundfile.loop();
  
  // 音声解析を初期化し、入力を設定する
  rms = new Amplitude(this);
  rms.input(soundfile);
}

void draw () {
  background(0);
  
  // 音量を解析して値を調整する
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);
  ellipse(width/2, height/2, diameter, diameter);
}
