int NUM = 1000;
ParticleVec3[] particles = new ParticleVec3[NUM];

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  
  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec3();
    particles[i].location.set(random(width), random(height), random(height/2));
    particles[i].friction = 0.02;
    particles[i].radius = 0.5;
    particles[i].mass = random(1, 2);
  }
  noStroke();
  background(0);
}

void draw() {
  // 背景のフェード
  fill(0, 15);
  rect(0, 0, width, height);
  
  // パーティクルのアニメーション
  fill(255);
  for (int i = 0; i < NUM; i++) {
    for (int j = 0; j < i; j++) {
      particles[i].attract(particles[j].location, particles[j].mass, 2.0, 800.0);
    }
    particles[i].update();
    particles[i].draw();
    particles[i].throughWalls();
  }
}
