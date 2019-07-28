int NUM = 2000;
ParticleVec3[] particles = new ParticleVec3[NUM];

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  
  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec3();
    particles[i].location.set(random(width), random(height), random(height/2));
    particles[i].gravity.set(0.0, 0.0, 0.0);
    particles[i].friction = 0.01;
    particles[i].radius = 2.0;
  }
  
  background(0);
}

void draw() {
  // 背景のフェード
  noStroke();
  fill(0, 31);
  rect(0, 0, width, height);
  
  // パーティクルのアニメーション
  fill(255);
  for (int i = 0; i < NUM; i++) {
    particles[i].update();
    particles[i].draw();
    particles[i].bounceOffWalls();
  }
}

void mouseDragged() {
  for (int i = 0; i < NUM; i++) {
    PVector mouseLoc = new PVector(mouseX, mouseY);
    particles[i].attract(mouseLoc, 200, 5, 20);
  }
}
