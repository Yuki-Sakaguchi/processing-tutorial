import processing.video.*;
import processing.sound.*;

Capture cam;
AudioIn in;
FFT fft;
int bands = 64;
float[] sum = new float[bands]; // FFT解析結果を保存する配列
float smoothFactor = 1.0; // スムージングの細かさ
float scale = 8.0;

public void setup () {
  size(800, 500, P3D); 
  frameRate(60);
  blendMode(ADD);
  
  cam = new Capture(this);
  cam.start();
  
  in = new AudioIn(this, 0);
  in.start();
  
  fft = new FFT(this, bands);
  fft.input(in);
}

public void draw () {
  background(0);
  noFill();
  strokeWeight(2.0);
  
  fft.analyze();
  for (int i = 0; i < bands; i++) {
    // 解析結果をスムージングして配列に保存
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothFactor;
  }
  
  float hStep = height / float(bands) / 2.0;
  float wStep = 4.0;
  int n;
  
  // 上半分の映像
  n = 0;
  for (float j = height/2; j > 0; j -= hStep) {
    beginShape();
    for (float i = 0; i < width; i += wStep) {
      color col = cam.get(int(i), int(j));
      float br = brightness(col);
      stroke(col);
      vertex(i, j, br * sum[n] * scale);
    }
    endShape();
    n++;
  }
  
  // 下半分の映像
  n = 0;
  for (float j = height/2 + hStep; j < height; j += hStep) {
    beginShape();
    for (float i = 0; i < width; i += wStep) {
      color col = cam.get(int(i), int(j));
      float br = brightness(col);
      stroke(col);
      vertex(i, j, br * sum[n] * scale);
    }
    endShape();
    n++;
  }
}

void captureEvent (Capture c) {
  cam.read();
}
