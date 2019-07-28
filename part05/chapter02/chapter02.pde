import processing.video.*;
Movie movie;
boolean playing;

void setup () {
  size(1920, 1080);
  frameRate(60);
  background(0);
  noStroke();
  
  movie = new Movie(this, "sample.mp4");
  movie.loop();
  playing = true;
}

void draw () {
  background(0);
  
  int skip = 20;
  for (int j = skip/2; j < height; j += skip) {
    for (int i = skip/2; i < width; i += skip) {
      color col = movie.get(i, j); // 指定した座標の色を読み込む
      float br = brightness(col); // 色から明るさを抽出
      fill(col);
      ellipse(i, j, skip * br / 255.0, skip * br / 255.0); // 明るければ大きい円になるように配置
    }
  }
}

void movieEvent (Movie m) {
  m.read();
}

void mouseReleased () {
  if (playing) {
    movie.pause();
    playing = false;
  } else {
    movie.play();
    playing = true;
  }
}
