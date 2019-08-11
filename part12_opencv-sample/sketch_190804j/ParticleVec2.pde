class TriangleVec2 {
  PVector force; // 力
  PVector acceleration; // 加速度
  PVector location; // 位置
  PVector velocity; // 速度
  PVector gravity; // 重力
  float mass; // 質量
  float friction; // 摩擦力
  color col; // 色
  PVector min; // 稼働範囲(min)
  PVector max; // 稼働範囲(max)
  float radius; // パーティクル半径
  float angle; // 角度
  int life; // ヒットポイント
  float G; // 重力定数

  TriangleVec2() {
    radius = 4.0;
    mass = 1.0;
    friction = 0.01;
    G = 1.0;
    location = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
    gravity = new PVector(0.0, 0.0);
    min = new PVector(0.0, 0.0);
    max = new PVector(width, height);
    col = color(0, 127, 255);
    angle = random(360);
    life = 100;
  }
  
  void update() {
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.mult(1.0 - friction);
    location.add(velocity);
    acceleration.set(0, 0);
    angle += 30;
    life -= 10;
  }
  
  void draw() {
    noStroke();
    fill(col, 153);
    pushMatrix();
    translate(location.x, location.y);  // 中心となる座標
    rotate(radians(angle));
  
    // 円を均等に3分割する点を結び、三角形をつくる
    beginShape();
    for (int i = 0; i < 3; i++) {
      vertex(radius*cos(radians(360*i/3)), radius*sin(radians(360*i/3)));
    }
    endShape(CLOSE);
  
    popMatrix();
  }
  
  void bounceOffWalls() {
    if (location.x > max.x) {
      location.x = max.x;
      velocity.x *= -1;
    }
    if (location.x < min.x) {
      location.x = min.x;
      velocity.x *= -1;
    }
    if (location.y > max.y) {
      location.y = max.y;
      velocity.y *= -1;
    }
    if (location.y < min.y) {
      location.y = min.y;
      velocity.y *= -1;
    }  
  }
  
  void throughWalls() {
    if (location.x > max.x) {
      location.x = min.x;
    }
    if (location.x < min.x) {
      location.x = max.x;
    }
    if (location.y > max.y) {
      location.y = min.y;
    }
    if (location.y < min.y) {
      location.y = max.y;
    } 
  }
  
  void addForce(PVector force) {
    force.div(mass);
    acceleration.add(force);
  }
  
  void attract (PVector center, float _mass, float min, float max) {
    // 距離を計算する
    float distance = PVector.dist(center, location);
    
    // 距離を指定した範囲内に収める
    distance = constrain(distance, min, max);
    
    // 引力の強さを算出する（F = G(Mm/r^2）)
    float strength = G * (mass * _mass) / (distance * distance);
    
    // 引力の中心点とパーティクル間のベクトルを作成する
    PVector force = PVector.sub(center, location);
    
    // ベクトルを正規化する
    force.normalize();
    
    // ベクトルに力の強さを乗算する
    force.mult(strength);
    
    // 力を加える
    addForce(force);
  }
}
