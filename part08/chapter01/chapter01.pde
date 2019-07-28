void setup () {
  size(800, 600, P3D);
}

void draw () {
  background(0);
  lights(); // ライティングをONにする
  translate(width/2, height/2, 0); // 画面の真ん中を中心に
  rotateX(millis()/1000.0 * 1.0); // x軸を中心に回転
  rotateY(millis()/1000.0 * 1.5); // y軸を中心に回転
  fill(255);
  noStroke();
  box(200);
}
