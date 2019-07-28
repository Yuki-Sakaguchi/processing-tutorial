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
  rectMode(CENTER);
  
  int skip = 10;
  for (int j = skip/2; j < height; j += skip) {
    for (int i = skip/2; i < width; i += skip) {
      color col = movie.get(i, j);
      float br = brightness(col);
      fill(col, 127);
      pushMatrix();
      translate(i, j);
      float angle = map(br, 0, 255, 0, PI); // 明るさを角度に変換
      rotate(angle); // 明るい方が角度がついて横になる
      rect(0, 0, skip * br / 32.0, skip/2.0); // 明るい方が高い縦棒
      popMatrix();
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
