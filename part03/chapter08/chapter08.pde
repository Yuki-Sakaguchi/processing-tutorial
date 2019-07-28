void setup() {
  size(800, 600);
  noStroke();
  int step = 5;
  float noiseScale = 0.02;
  for (int j = 0; j < height; j += step) {
    for (int i = 0; i < width; i += step) {
      float gray = noise(i * noiseScale, j * noiseScale) * 255;
      fill(gray);
      rect(i, j, step, step);
    }
  }
}
