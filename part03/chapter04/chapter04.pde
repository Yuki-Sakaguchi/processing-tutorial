int NUM = 1000;
ParticleVec2[] particles = new ParticleVec2[NUM];

void setup() {
  size(800, 600);
  frameRate(60);
  
  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec2();
    particles[i].location.set(width/2, height/2);

    float angle = random(PI * 2.0);
    float length = random(20);
    float posX = cos(angle) * length;
    float posY = sin(angle) * length;
    particles[i].acceleration.set(posX, posY);
    
    particles[i].gravity.set(0.0, 0.0);
    particles[i].friction = 0.01;
  }
}

void draw() {
  // 背景をフェードさせる
  fill(0, 31);
  rect(0, 0, width, height);
  noStroke();
  fill(255);
  
  for (int i = 0; i < NUM; i++) {
    particles[i].update();
    particles[i].draw();
    particles[i].bounceOffWalls();
    // particles[i].throughWalls();
  }
}

void mouseDragged() {
  for (int i = 0; i < NUM; i++) {
    PVector mouseLoc = new PVector(mouseX, mouseY);
    particles[i].attract(mouseLoc, 200, 5, 20);
  }
}
