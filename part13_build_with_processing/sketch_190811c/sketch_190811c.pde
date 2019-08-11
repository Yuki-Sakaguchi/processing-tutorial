// 黒背景にカラフルな線を引く
// 印刷用に色々設定する

import processing.pdf.*;
 
int dpi = 72;
float widthMm = 420;
float heightMm = 297;

// ミリで指定した値をインチに変換して解像度を合わせる
int widthPix = int(widthMm * 0.03937 * dpi);
int heightPix = int(heightMm * 0.03937 * dpi);

void settings() {
  size(widthPix, heightPix, PDF, "step_07_a.pdf"); 
}

void setup() {
  colorMode(HSB, 100);
  background(0);
  noFill();
  
  PFont font = createFont("Verdana", 24);
  textFont(font, 20);
  
  int rangeColor = 10;
  int rangeY = 2;
  float flucColor = 50;
  float flucY;
  
  for (int y = 0; y < height; y += 5) {
    flucColor += random(-rangeColor, rangeColor);
    stroke(flucColor, 60, 99, 30);
    
    flucY = 0;
    
    beginShape();
    
    for (int x = 0; x <= width; x += 5) {
      flucY += random(-rangeY, rangeY);
      vertex(x, y + flucY);
    }
    
    endShape();
  }
  
  textAlign(RIGHT);
  text("fluclines : Build with Processing", width - 100, height - 50);
  
  exit();
}
