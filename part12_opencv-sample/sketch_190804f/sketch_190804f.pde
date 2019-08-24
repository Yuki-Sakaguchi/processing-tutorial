/**
 * 動体検知
 * opticalFlowで動いているところだけパーティクルを青くする
 */
import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture video;

void setup () {
  size(640, 480);
  frameRate(60);

  // 計算が重い処理をするので、動画の大きさを半分にして負荷を下げてる
  opencv = new OpenCV(this, width/2, height/2);
  video = new Capture(this, width/2, height/2);
  video.start();
  
  // opencv.startBackgroundSubtraction(5, 3, 0.5);
}

void draw () {
  scale(2); // 負荷を下げるために小さくしていた動画を大きくして表示してる
  opencv.loadImage(video);
  //opencv.updateBackground();
  //opencv.dilate();
  //opencv.erode();
  image(video, 0, 0);
  
  opencv.calculateOpticalFlow(); // オプティカルフローを計算
  stroke(255, 0, 0);
  // opencv.drawOpticalFlow(); // オプティカルフローを描画
  
  noStroke();
  int skip = 5;
  int limit = 5;
  for (int j = skip/2; j < height/2; j += skip) {
    for (int i = skip/2; i < width/2; i += skip) {
       PVector vec = opencv.getFlowAt(i, j);
       // println(vec);
       // particles[i].addForce(vec.mult(0.1));
       //color col = video.get(i, j);
       //float br = brightness(col);
       
       if (Math.abs(vec.x) > limit && Math.abs(vec.y) > limit) {
         fill(0, 127, 255);
         ellipse(i, j, skip, skip);
       } else {
         fill(0, 255, 127);
         ellipse(i, j, skip, skip);
       }
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
