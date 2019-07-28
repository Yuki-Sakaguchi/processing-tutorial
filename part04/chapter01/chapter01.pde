PImage img;

void setup() {
  size(800, 600);
  img = loadImage("sample.jpg");
  img.filter(BLUR, 10); // ぼかす
}

void draw() {
  background(0);
  tint(127); // 明るさなどを調整
  image(img, 0, 0);
}
