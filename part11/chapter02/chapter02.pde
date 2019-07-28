// 輪郭抽出
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
}

void draw () {
  scale(2); // 負荷を下げるために小さくしていた動画を大きくして表示してる
  opencv.loadImage(video);
  image(video, 0, 0);
  
  opencv.calculateOpticalFlow(); // オプティカルフローを計算
  stroke(255, 0, 0);
  opencv.drawOpticalFlow(); // オプティカルフローを描画
  
  // オプティカルフローの平均を解析
  PVector aveFlow = opencv.getAverageFlow();
  int flowScale = 50;
  
  // オプティカルフローの平均を描画
  stroke(0, 0, 255);
  line(video.width/2, video.height/2, video.width/2 + aveFlow.x*flowScale, video.height/2 + aveFlow.y*flowScale);
}

void captureEvent (Capture c) {
  c.read();
}
