import processing.sound.*;
AudioIn in;
FFT fft;
int bands = 128;
float scale = 10000.0;

void setup () {
  size(800, 600, P2D);
  noStroke();
  blendMode(ADD);

  in = new AudioIn(this, 0);
  in.start();

  fft = new FFT(this, bands);
  fft.input(in);
}

void draw () {
  background(0);
 
  fft.analyze();
  
  float w = width / float(bands)/2.0;
  for (int i = 0; i < bands; i++) {
    fill(8);
    float diameter = fft.spectrum[i] * scale;
    ellipse(width/2.0 + i * w, height/2.0, diameter, diameter);
    ellipse(width/2.0 - i * w, height/2.0, diameter, diameter);
  }
}
