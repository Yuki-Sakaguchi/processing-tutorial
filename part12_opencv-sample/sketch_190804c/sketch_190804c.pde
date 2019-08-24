/**
 * マイクからの入力の音量に合わせて動く四角
 */
// http://94.hatenadiary.jp/?page=1558696558
import ddf.minim.*;
import ddf.minim.effects.*;
AudioInput in;

Minim minim;         //mimimをつかう
AudioPlayer groove;  //オーディオプレイヤーを宣言する

void setup() {
  size(1024, 1024);
  delay(5000);//画面収録用

  minim = new Minim(this); //初期化
  
  in = minim.getLineIn();
  
  rectMode(CENTER);
  
}

void draw() {
  int rectsize = 7;   //横の間隔

  background(0); //背景
  strokeWeight(1);
  stroke(255,255); //描画設定
  noFill();

  for (int i = 0; i < width; i+=rectsize) {
    pushMatrix();
    translate(width/2, height/2);
     rotate(in.mix.get(i) * 10 / (i * 0.01));
    rect(0, 0, i, i); //四角形を描画
    popMatrix();
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
