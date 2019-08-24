/**
 * 動体に反応して、三角形のパーティクルを発生させる
 * opticalFlowに応じて移動する向きが変わる
 */
import gab.opencv.*;
import processing.video.*;
import ddf.minim.*;

OpenCV opencv;
Capture video;
ArrayList<TriangleVec2> triangles = new ArrayList<TriangleVec2>();

void setup () {
  size(640, 480);
  frameRate(60);
  
  colorMode(HSB, 360, 100, 100);

  opencv = new OpenCV(this, width/2, height/2);
  video = new Capture(this, width/2, height/2);
  video.start();
}

void draw () {
  blendMode(BLEND);
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0);
  
  opencv.calculateOpticalFlow();
  stroke(255, 0, 0);
  
  noStroke();
  int skip = 5;
  int limit = 8;
 
  for (int j = skip/2; j < height/2; j += skip) {
    for (int i = skip/2; i < width/2; i += skip) {
       PVector vec = opencv.getFlowAt(i, j);       
       if (Math.abs(vec.x) > limit && Math.abs(vec.y) > limit) {
          TriangleVec2 triangle = new TriangleVec2();
          float size = map(vec.x, limit, 15, 4.0, 6.0);
          triangle.location.set(i, j);
          triangle.gravity.set(0, 0);
          triangle.radius = size;
          triangle.col = color(200, random(50, 100), 100);
          triangles.add(triangle);
       }
    }
  }
  
  for (int i = 0; i < triangles.size(); i++) {
    triangles.get(i).update();
    triangles.get(i).draw();
    
    if (triangles.get(i).location.x > 0 && triangles.get(i).location.x < video.width
    &&  triangles.get(i).location.y > 0 && triangles.get(i).location.y < video.height) {
      // 現在のパーティクルの場所のオプティカルフローのベクトルを取得する
      PVector vec = opencv.getFlowAt(int(triangles.get(i).location.x), int(triangles.get(i).location.y));
      triangles.get(i).addForce(vec.mult(0.1));
    }
    
    if (triangles.get(i).life < 0) {
      triangles.remove(i);
    }
  }
}

void captureEvent (Capture c) {
  c.read();
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
