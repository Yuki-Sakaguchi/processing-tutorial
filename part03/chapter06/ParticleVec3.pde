class ParticleVec3 {
  PVector location; // 位置
  PVector velocity; // 速度
  PVector acceleration; // 加速度
  PVector gravity; // 重力
  float mass; // 質量
  float friction; // 摩擦力
  PVector min; // 稼働範囲(min)
  PVector max; // 稼働範囲(max)
  float radius; // パーティクル半径
  float G; // 重力定数

  ParticleVec3() {
    radius = 4.0;
    mass = 1.0;
    friction = 0.01;
    G = 1.0;
    
    location = new PVector(0.0, 0.0, 0.0);
    velocity = new PVector(0.0, 0.0, 0.0);
    acceleration = new PVector(0.0, 0.0, 0.0);
    gravity = new PVector(0.0, 0.0, 0.0);
    
    min = new PVector(0, 0, 0);
    max = new PVector(width, height, height/2);
  }
  
  void update() {
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.mult(1.0 - friction);
    location.add(velocity);
    acceleration.set(0, 0, 0);
  }
  
  void draw() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    ellipse(0, 0, mass * radius * 2, mass * radius * 2);
    popMatrix();
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
    if (location.z > max.z) {
      location.z = max.z;
      velocity.z *= -1;
    }
    if (location.z < min.z) {
      location.z = min.z;
      velocity.z *= -1;
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
    if (location.z > max.z) {
      location.z = min.z;
    }
    if (location.z < min.z) {
      location.z = max.z;
    } 
  }
}
