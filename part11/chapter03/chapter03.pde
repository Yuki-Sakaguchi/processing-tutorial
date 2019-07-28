import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture video;

int NUM = 2000;
ParticleVec3[] particles = new ParticleVec3[NUM];

void setup () {
  size(640, 480, P3D);
  frameRate(60);

  opencv = new OpenCV(this, width/2, height/2);
  video = new Capture(this, width/2, height/2);
  video.start();
  
  // パーティクルを初期化
  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec3();
    particles[i].radius = 1.5;
    particles[i].position.set(random(width/2), random(height/2), 0);
    particles[i].min.x = 0;
    particles[i].min.y = 0;
    particles[i].max.x = width/2;
    particles[i].max.y = height/2;
  }
}

void draw () {
  background(0);
  blendMode(ADD);
  scale(2);
  
  opencv.loadImage(video);
  opencv.calculateOpticalFlow();
  
  stroke(255, 0, 0);
  opencv.drawOpticalFlow();
  
  noStroke();
  fill(0, 127, 255);
  for (int i = 0; i < NUM; i++) {
    particles[i].update();
    particles[i].draw();
    particles[i].throughWalls();
    
    // パーティクルが画面内にある場合
    if (particles[i].position.x > 0 && particles[i].position.x < video.width
    &&  particles[i].position.y > 0 && particles[i].position.y < video.height) {
      // 現在のパーティクルの場所のオプティカルフローのベクトルを取得する
      PVector vec = opencv.getFlowAt(int(particles[i].position.x), int(particles[i].position.y));
      particles[i].addForce(vec.mult(0.1));
    }
  }
}

void captureEvent (Capture c) {
  c.read();
}
