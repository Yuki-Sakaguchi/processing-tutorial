import processing.sound.*;
AudioIn in; // サウンド入力
Amplitude rms;

void setup () {
  size(800, 800);
  fill(0, 127, 255);
  noStroke();

  // サウンド入力を初期化し、スタート
  in = new AudioIn(this, 0);
  in.start();

  rms = new Amplitude(this);
  rms.input(in);
}

void draw () {
  background(0);
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);
  ellipse(width/2, height/2, diameter, diameter);
}
