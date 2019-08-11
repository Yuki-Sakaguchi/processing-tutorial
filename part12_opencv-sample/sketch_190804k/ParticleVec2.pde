class ParticleVec2 {
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
  float life;

  ParticleVec2() {
    radius = 4.0;
    mass = 1.0;
    friction = 0.01;
    location = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
    gravity = new PVector(0.0, 0.0);
    min = new PVector(0.0, 0.0);
    max = new PVector(width, height);
    col = color(0, 127, 255);
    life = random(100, 120);
  }
  
  void update() {
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.mult(1.0 - friction);
    location.add(velocity);
    acceleration.set(0, 0);
    life -= 10;
  }
  
  void draw() {
    noStroke();
    fill(col);
    ellipse(location.x, location.y, mass * radius * 2, mass * radius * 2);
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
}
