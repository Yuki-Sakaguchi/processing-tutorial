// 水玉パターン
size(400, 400);
colorMode(RGB, 10);
background(9);
noStroke();

fill(4, 4, 9);
boolean offset = false;

for (int y = 0; y < 21; y++) {
  for (int x = 0; x < 21; x++) {
    if (offset) {
      ellipse(x*20, y*20, 10, 10);
    } else {
      ellipse(10 + x*20, y*20, 10, 10); // x軸だけちょっとずらす
    }
  }
  offset = !offset; // 一行ずつずらすかどうかのフラグを変更
}
