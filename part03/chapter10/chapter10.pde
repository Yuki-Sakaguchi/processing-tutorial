int NUM = 2000;
ParticleVec3[] particles = new ParticleVec3[NUM];
float noiseScale;
float noiseStrength;

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  noiseScale = 0.01;
  noiseStrength = 0.1;
  
  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec3();
    particles[i].location.set(random(width), random(height), random(height/2));
    particles[i].min.set(0, 0, 0);
    particles[i].max.set(width, height, width/2);
    particles[i].gravity.set(0.0, 0.0, 0.0);
    particles[i].friction = 0.1;
    particles[i].radius = 1.0;
  }
  
  background(255);
}

void draw() {
  noStroke();
  fill(0, 3);
  for (int i = 0; i < NUM; i++) {
    PVector force = new PVector();
    force.x = cos(noise(particles[i].location.x * noiseScale, particles[i].location.y * noiseScale, particles[i].location.z * noiseScale) * PI * 4.0);
    force.y = sin(noise(particles[i].location.x * noiseScale, particles[i].location.y * noiseScale, particles[i].location.z * noiseScale) * PI * 4.0);
    force.mult(noiseStrength);
    particles[i].addForce(force);
    particles[i].update();
    particles[i].draw();
    particles[i].throughWalls();
  }
}

void mousePressed() {
  noiseSeed(round(random(1000)));
  noiseScale = 0.01;
  for (int i = 0; i < NUM; i++) {
    particles[i].location.set(random(width), random(height), random(width/2));
  }
  background(255);
}
