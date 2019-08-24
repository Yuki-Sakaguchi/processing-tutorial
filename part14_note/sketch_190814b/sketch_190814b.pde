/**
 * 四角を回転させる
 */
float theta = 0.0;    //角度

//1秒で1回転するように30で割る。度数法だと12°
//更に6で割ると1周期6秒
float rad = (TWO_PI/30.0)/6;

void setup() {
  size(400, 400, P3D);
  frameRate(30);  //1秒30フレーム
  noStroke();
}

void draw() {
  // loadPixels();
  background(0);
  lights();    //基本ライトを設置

  //立体の中心を画面中央に移動
  pushMatrix();
  translate(width/2, height/2); 
  rotateX(theta);  //X軸に対してtheta分だけ回転
  rotateY(theta);  //Y軸に対してtheta分だけ回転
  fill(255);
  box(150, 150, 150);  //150x150x150pxの立方体を描画
  popMatrix();

  theta += rad;    //時間を進める
  if (theta > TWO_PI) theta = 0.0;    //1周期分終わったら原点に戻る
    
  saveFrame("frames/######.png");
}
