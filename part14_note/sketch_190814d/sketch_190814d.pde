float r = 150;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(0);
  fill(255);
  
  if (frameCount % 30 == 0) {
    Particle particle = new Particle();
    float angle = random(0, 180);
    particle.location.set(r * cos(angle), r * sin(angle));
    particle.velocity.set(2, 2);
    // particle.gravity.set(width/2, height/2);
    particles.add(particle);
  }
  
  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).update();
    particles.get(i).draw();
    if (particles.get(i).life < 0) {
      particles.remove(i);
    }
  }
}

class Particle {
  PVector force; // 力
  PVector acceleration; // 加速度
  PVector location; // 位置
  PVector velocity; // 速度
  PVector gravity; // 重力
  float mass; // 質量
  float friction; // 摩擦力
  float radius; // パーティクル半径
  int life;
  
  Particle() {
    radius = 1.0;
    mass = 1.0;
    friction = 0.01;
    location = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
    gravity = new PVector(0.0, 0.0);
    life = 40;
  }
  
  void update() {
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.mult(1.0 - friction);
    location.add(velocity);
    acceleration.set(0, 0);
    radius *= 1.1;
    if (radius > 30) {
      radius = 30;
    }
    life--;
  }
  
  void draw () {
    //pushMatrix();
    // translate(width/2, height/2);
    ellipse(location.x, location.y, radius, radius);
    // popMatrix();
  }
}
