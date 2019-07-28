class Particle {
  color col;
  float diameter;
  PVector location;
  PVector velocity;
  
  Particle(float _diameter) {
    // 大きさ設定
    diameter = _diameter;
    
    // 位置ベクトル初期化
    location = new PVector(random(0, width), random(0, height));
    
    // 速度ベクトル初期化
    velocity = new PVector(random(-4, 4), random(-4, 4));
    
    // 色の初期化
    col = color(random(255), random(255), random(255));
  }
  
  void draw() {
    // 色設定
    fill(col);
    
    // 指定の位置に円を描画
    ellipse(location.x, location.y, diameter, diameter);
    
    // 位置ベクトルに速度を加算（次の位置になる）
    location.add(velocity);
    
    // 画面からはみ出たら速度ベクトルを逆向きにする
    if ((location.x < 0) || (location.x > width)) {
      velocity.x *= -1;
    }
    if ((location.y < 0) || (location.y > height)) {
      velocity.y *= -1;
    }
  }
}
