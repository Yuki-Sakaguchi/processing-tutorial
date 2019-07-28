import processing.pdf.*;

float strength = 1400.0; // ノイズの強さ
int step = 6; // グリッドの細かさ
float noiseScale = 0.002; // パーリンノイズのスケール

void setup() {
  size(1920, 1200);
  noLoop(); // drawを１回だけの処理
}

void draw() {
  // PDF書き出し
  beginRecord(PDF, "output.pdf");
  background(255);
  stroke(191);
  noFill();
  
  // 2次元のパーリングノイズをペジェ曲線で描画
  for (int j = -height*2; j < height*2; j += step) {
    beginShape();
    for (int i = -width*2; i < width*1.5; i += step) {
      float noise = noise(i * noiseScale, j * noiseScale) * strength;
      curveVertex(i, j + noise + (i * 0.95));
    }
    endShape();
  }
  endRecord();
}
