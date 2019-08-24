/**
 * 動体と音に反応して、パーティクルを発生させる
 * クリックすると重力が逆になる
 */
import gab.opencv.*;
import processing.video.*;
import ddf.minim.*;

OpenCV opencv;
Capture video;
Minim minim;
AudioInput audioIn;
ArrayList<ParticleVec2> particles = new ArrayList<ParticleVec2>();
boolean gravity = false;

void setup () {
  size(640, 480);
  frameRate(60);
  
  colorMode( HSB, 360, 100, 100 );

  opencv = new OpenCV(this, width/2, height/2);
  video = new Capture(this, width/2, height/2);
  video.start();
  
  minim = new Minim(this);
  audioIn = minim.getLineIn(Minim.STEREO, 512);
}

void draw () {
  blendMode(BLEND);
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0);
  
  opencv.calculateOpticalFlow();
  stroke(255, 0, 0);
  
  float level = audioIn.mix.level()*1000;
  
  noStroke();
  int skip = 5;
  int limit = 5;
  if (level > 2) {
    for (int j = skip/2; j < height/2; j += skip) {
      for (int i = skip/2; i < width/2; i += skip) {
         PVector vec = opencv.getFlowAt(i, j);       
         if (Math.abs(vec.x) > limit && Math.abs(vec.y) > limit) {
            ParticleVec2 particle = new ParticleVec2();
            float size = map(vec.x, limit, 10, 1.0, 3.0);
            float gra = Math.abs(0.8*(size/2)); // 大きい方が影響を受けやすい
            particle.location.set(i, j);
            if (gravity) {
              particle.gravity.set(0, gra);
            } else {
              particle.gravity.set(0, -gra);
            }
            particle.radius = size;
            particle.col = color(random(360), 60, 100);
            particles.add(particle);
         }
      }
    }
  }
  
  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).update();
    particles.get(i).draw();
    if (particles.get(i).location.y > height/2) {
      particles.remove(i);
    }
  }
}

void captureEvent (Capture c) {
  c.read();
}

void mouseClicked (){
 gravity = !gravity;
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
