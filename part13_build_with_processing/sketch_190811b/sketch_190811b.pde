// チェック柄
size(200, 200);
colorMode(RGB, 10);
background(8, 0, 0); // 背景は赤
noStroke();

// 大きい黒い線を縦横に引く
fill(0, 0, 0, 4);
for (int i = 0; i < 5; i++) {
  rect(0, 10 + i*40, width, 20);
  rect(10 + i*40, 0, 20, height);
}

// 細い線を引く
fill(9, 9, 9, 3);
for (int i = 0; i < 5; i++) {
  rect(0, 10 + i*40 + 3, width, 2);
  rect(0, 10 + i*40 + 15, width, 2);
  rect(10 + i*40 + 3, 0, 2, height);
  rect(10 + i*40 + 15, 0, 2, height);
}
