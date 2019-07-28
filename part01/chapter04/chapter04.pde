size(800, 600);
background(0);
noStroke();
int num = 10000;

for (int i = 0; i < num; i++) {
  float x = random(0, width); // random()は乱数を生成する関数
  float y = random(0, height);
  
  // 生成したランダムの位置と画面の中心との距離を計算する
  float dist = dist(x, y, width / 2, height / 2); // dist()は２点間の距離を求める関数
  
  
  if (dist < height / 2) {
    // 距離が高さの半分より小さい場合
    noStroke();
    fill(83, 127, 255);
  } else {
    // 距離が高さの半分より大きい場合
    noFill();
    stroke(31, 127, 255);
  }
  
  ellipse(x, y, 10, 10);
}
