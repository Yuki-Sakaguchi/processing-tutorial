/**
 * 格子状に配置された矩形が波のように大きくなるアニメーション
 */
 
void setup () {
  size(800, 800);
  noStroke();
  rectMode(CENTER);
  colorMode(HSB);
}

void draw() {
  background(252);
  scale(10);
  float r, step = 5, f = frameCount;
  for (float x = step; x < 78; x += step) {
    // ここが何やってるかわからん！天才か...
    for (int i = 1; i < 16; r = pow(1-(f-i)%60/60.,3), fill(f%255,255,r*255), square(x,5*i++,1+2.5*r));
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
