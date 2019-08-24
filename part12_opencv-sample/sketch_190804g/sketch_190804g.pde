/**
 * 動体検知で動いているものを赤い四角で囲う
 */
import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencv;

void setup() {
  size(720, 480, P2D);
  video = new Capture(this, 720, 480);
  opencv = new OpenCV(this, 720, 480);

  opencv.startBackgroundSubtraction(5, 3, 0.5);

  video.start();
}

void draw() {  
  opencv.loadImage(video);
  opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

  image(video, 0, 0);
  
  noFill();
  stroke(255,0,0);
  strokeWeight(2);
  for(Contour contour : opencv.findContours()){
    Rectangle r = contour.getBoundingBox();
    rect(r.x, r.y, r.width, r.height);
  }    
}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
