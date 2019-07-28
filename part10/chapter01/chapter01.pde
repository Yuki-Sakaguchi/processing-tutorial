// 送信側
// OSC関連のライブラリをインポート
import netP5.*;
import oscP5.*;

OscP5 oscP5; // OSCP5クラスのインスタンス
NetAddress myRemoteLocation; // OSC送出先のネットアドレス

void setup () {
  size(800, 600);
  frameRate(60);
  
  // ポート12001に設定して新規にOSCP5のインスタンスを生成する
  oscP5 = new OscP5(this, 12001);
  
  // OSC送信先のIPアドレスとポートを指定する
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
}

void draw () {
  background(0);
  
  // マウスの位置に円を書く
  noFill();
  stroke(255);
  ellipse(mouseX, mouseY, 10, 10);
  
  // 現在のマウスの位置をOSCで送信
  OscMessage myMessage = new OscMessage("/mouse/position");
  myMessage.add(mouseX); // X座標を追加
  myMessage.add(mouseY); // Y座標を追加
  oscP5.send(myMessage, myRemoteLocation); // OSCメッセージ送信
}

void mousePressed () {
  OscMessage myMessage = new OscMessage("/mouse/click");
  myMessage.add(1);
  myMessage.add(mouseX);
  myMessage.add(mouseY);
  oscP5.send(myMessage, myRemoteLocation);
}

void mouseReleased () {
  OscMessage myMessage = new OscMessage("/mouse/click");
  myMessage.add(0);
  oscP5.send(myMessage, myRemoteLocation);
}
