import fisica.*;
FWorld world;
FPoly poly; // ポリゴン設定
float speed = 4.0; // スピード

void setup () {
  size(800, 600);
  frameRate(60);
  Fisica.init(this);
  world = new FWorld();
}

void draw () {
  background(255);
  world.step(speed / 60.0);
  world.draw(this);
  if (poly != null) {
    poly.draw(this);
  }
}

void keyPressed () {
  // bキーを押したら矩形を生成
  if (key == 'b') {
    float width = random(10, 40);
    float height = random(10, 40);
    FBox box = new FBox(width, height);
    box.setPosition(mouseX, mouseY);
    box.setRestitution(0.6);
    box.setFill(31, 127, 255);
    box.setStroke(31);
    world.add(box);
  }
  
  // cキーを押したら丸を生成
  if (key == 'c') {
    float radius = random(10, 40);
    FCircle circle = new FCircle(radius);
    circle.setPosition(mouseX, mouseY);
    circle.setRestitution(0.6);
    circle.setFill(255, 127, 31);
    circle.setStroke(31);
    world.add(circle);
  }
  
  // qキーを押したらクリア
  if (key == 'q') {
    world.clear();
  }
}

void mousePressed () {
  poly = new FPoly(); // 新規にポリゴンを生成
  poly.setFill(127);
  poly.setStatic(true); // 画面に固定する
  poly.vertex(mouseX, mouseY); // 現在のマウスの位置を頂点に指定する
}

void mouseDragged () {
  if (poly != null) {
    poly.vertex(mouseX, mouseY);
  }
}

void mouseReleased () {
  if (poly != null) {
    world.add(poly);
    poly = null;
  }
}
