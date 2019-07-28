int ANUM = 20; // アトラクターの数
int NUM = 2000;
ParticleVec3[] attractors = new ParticleVec3[ANUM];
ParticleVec3[] particles = new ParticleVec3[NUM];

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  
  for (int i = 0; i < ANUM; i++) {
    attractors[i] = new ParticleVec3();
    attractors[i].location.set(random(width), random(height), random(height/2));
    attractors[i].radius = 5.0;
  }
  
  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec3();
    particles[i].location.set(random(width), random(height), random(height/2));
    particles[i].gravity.set(0.0, 0.0, 0.0);
    particles[i].friction = 0.001;
    particles[i].radius = 1.0;
    particles[i].mass = random(2.0);
  }
  
  background(0);
}

void draw() {
  // 背景のフェード
  fill(0, 15);
  rect(0, 0, width, height);
  
  // パーティクルのアニメーション
  noStroke();
  for (int j = 0; j < ANUM; j++) {
    fill(255, 0, 0);
    attractors[j].draw();
    for (int i = 0; i < NUM; i++) {
      particles[i].attract(attractors[j].location, 50, 10, 800);
    }
  }
  
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
