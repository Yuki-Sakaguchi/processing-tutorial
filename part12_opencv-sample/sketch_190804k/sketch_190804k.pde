/**
 * 光を検知してパーティクルを表示する
 */
import gab.opencv.*;
import processing.video.*;

Capture video;
OpenCV cv;
ArrayList<ParticleVec2> particles = new ArrayList<ParticleVec2>();
int mag = 2; // 映像の倍率

void setup () {
  size(640, 480);
  frameRate(60);
  
  colorMode(HSB, 360, 100, 100);
  
  cv = new OpenCV(this, width/mag, height/mag);
  video = new Capture(this, width/mag, height/mag);
  video.start();
}

void draw () {
  scale(mag);

  cv.loadImage(video);
  cv.gray(); // 映像をグレーに
  cv.threshold(240); // 映像の閾値を決めて明るめのところだけ取得
  PImage th = cv.getOutput(); // グレーの閾値の映像を取得
  image(video, 0, 0); // 色々といじったのとは別の普通の映像を表示
  
  // パーティクルのためにうっすら映像を黒くする
  fill(0, 180);
  rect(0, 0, width/mag, height/mag);
  
  // 映像の明るいところにパーティクルを表示
  noStroke();
  int skip = 5;
  int limit = 99;
  for (int j = skip/mag; j < height/mag; j += skip) {
    for (int i = skip/mag; i < width/mag; i += skip) {
       int col = th.get(i, j);
       float br = brightness(col);
       if (br > limit) {
         fill(0, 127, 255);
         ParticleVec2 particle = new ParticleVec2();
         particle.location.set(i, j);
         particle.gravity.set(random(-0.8, 0.8), random(-0.8, 0.8));
         particle.radius = random(2.0, 5.0);
         particle.col = color(random(360), 60, 100, 153);
         particles.add(particle);
       }
    }
  }
  
  // パーティクルがなくなったら削除
  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).update();
    particles.get(i).draw();
    if (particles.get(i).location.y > height/mag
    || particles.get(i).location.y < 0
    || particles.get(i).location.x > width/mag
    || particles.get(i).location.x < 0
    || particles.get(i).life < 0){
      particles.remove(i);
    }
  }
}

void captureEvent (Capture c) {
  c.read();
}
