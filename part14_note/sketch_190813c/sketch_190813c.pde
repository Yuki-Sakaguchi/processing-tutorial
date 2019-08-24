void setup() {
  size(400, 300, P3D);
  noFill();
  stroke(0);
 
  //orthofrustum(左、右、下、上、近い面までの距離、遠い面までの距離);
  ortho(0, width, 0, height);
}
 
void draw() {
  background(255);
  
  int size = 50;
 
  pushMatrix(); 
  translate(width, height/3);  //基準点を画面中央。z軸方向には-100
  rotateX(radians(-30));
  rotateY(radians(-30));
  box(size);
  popMatrix();
}
