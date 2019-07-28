import processing.sound.*;
AudioIn in;
FFT fft;
int bands = 128;
float scale = 5000.0;

void setup () {
  size(800, 600);

  in = new AudioIn(this, 0);
  in.start();

  fft = new FFT(this, bands);
  fft.input(in);
}

void draw () {
  background(0);
  
  fft.analyze();
  
  float w = width / float(bands);
  for (int i = 0; i < bands; i++) {
    // 解析結果を色の明るさに反映（音が大きいと白く、低いと暗い）
    fill(fft.spectrum[i] * scale);
    // 左右対象に縦長の四角を描く
    rect(width/2.0 + i * w, 0, w, height);
    rect(width/2.0 - i * w, 0, w, height);
  }
}
