PVector force; // 力
PVector acceleration; // 加速度
PVector location; // 位置
PVector velocity; // 速度
PVector gravity; // 重力
float mass; // 質量
float friction; // 摩擦力
PVector min; // 稼働範囲(min)
PVector max; // 稼働範囲(max)

void setup() {
  size(800, 600);
  frameRate(60);
  
  // 初期化
  location = new PVector(0.0, 0.0);
  velocity = new PVector(0.0, 0.0);
  gravity = new PVector(0.0, 1.0); // 下向きのベクトル
  force = new PVector(12.0, 8.0); // xに3.0, yに2.0の力がかかる
  min = new PVector(0.0, 0.0);
  max = new PVector(width, height);
  mass = 1.0; // 質量は1.0
  friction = 0.01; // 摩擦力は0.01
  acceleration = force.mult(mass); // 質量と力から加速度を算出 
}

void draw() {
  // 背景をフェードさせる
  fill(0, 31);
  rect(0, 0, width, height);
  
  // 円を描画する
  fill(255);
  noStroke();
  acceleration.add(gravity); // 加速度に重力を加える
  velocity.add(acceleration); // 加速度から速度を算出
  velocity.mult(1.0 - friction); // 摩擦力で速度を変化
  location.add(velocity); // 速度から位置を算出
  acceleration.set(0, 0); // 加速度をリセット
  ellipse(location.x, location.y, 20, 20);
  bounceOffWalls();
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
