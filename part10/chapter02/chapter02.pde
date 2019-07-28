// 受信側
import netP5.*;
import oscP5.*;

OscP5 oscP5;
PVector mouseLoc; // マウスの位置ベクトル
color bgColor;
ArrayList<Ring> rings; 

void setup () {
  size(800, 600);
  frameRate(60);
  
  // ポート12000に設定して新規にOSCP5のインスタンスを生成する
  oscP5 = new OscP5(this, 12000);
  
  // マウスの位置ベクトルを初期化
  mouseLoc = new PVector(width/2, height/2);
  
  // 広がる円のための配列
  rings = new ArrayList<Ring>();
}

void draw () {
  background(bgColor);
  
  // マウスの位置に円を書く
  noFill();
  stroke(255);
  ellipse(mouseLoc.x, mouseLoc.y, 10, 10);
  
  // 広がる円を描く
  for (int i = 0; i < rings.size(); i++) {
    rings.get(i).draw();
    // 一定より大きくなったら削除
    if (rings.get(i).radius > width*2) {
      rings.remove(i);
    }
  }
}

void oscEvent (OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/mouse/position") == true) {
    mouseLoc.x = theOscMessage.get(0).intValue();
    mouseLoc.y = theOscMessage.get(1).intValue();
  } else if (theOscMessage.checkAddrPattern("/mouse/click") == true) {
    if (theOscMessage.get(0).intValue() == 1) {
      bgColor = color(255, 255, 255);
      PVector location = new PVector();
      location.x = theOscMessage.get(1).intValue();
      location.y = theOscMessage.get(2).intValue();
      Ring r = new Ring(location);
      rings.add(r);
    } else {
      bgColor = color(0);
    }
  }
}

class Ring {
  PVector location;
  float radius;
  float speed;
  
  Ring (PVector _location) {
    location = new PVector();
    location = _location;
    radius = 0;
    speed = 5.0;
  }
  
  void draw () {
    strokeWeight(4.0);
    noFill();
    stroke(0, 127, 255);
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, radius, radius);
    popMatrix();
    radius += speed;
    strokeWeight(1.0);
  }
}
