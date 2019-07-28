import processing.video.*; // ビデオライブラリのインポート
Movie movie; // ムービープレイヤーの宣言
boolean playing; // 再生中かどうか

void setup () {
  size(853, 480);
  frameRate(60);
  background(0);
  noStroke();
  
  // 再生するムービーの読み込み
  movie = new Movie(this, "sample.mp4");
  movie.loop();
  playing = true;
}

void draw () {
  image(movie, 0, 0, width, height); // ムービーを画面に描画する
  
  float percent = movie.time() / movie.duration(); // 現在どこまで再生されているか割合を出す
  
  float length = map(percent, 0.0, 1.0, 0.0, width); // シークバーの長さを計算
  
  fill(255, 0, 0);
  rect(0, height-4, length, 4);
}

// ムービーのフレームが更新された時に動く処理
void movieEvent (Movie m) {
  m.read(); // 現在のフレームを読み込む
}

// マウスクリックで再生、停止
void mouseReleased () {
  if (playing) {
    movie.pause();
    playing = false;
  } else {
    movie.play();
    playing = true;
  }
}
