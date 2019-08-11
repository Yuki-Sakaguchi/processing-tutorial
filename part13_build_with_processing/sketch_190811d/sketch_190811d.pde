// 青い文字が円の形に集まる
size(400, 400);
colorMode(HSB, 100);
background(99);

textAlign(CENTER);
int count = 0;

while (count < 400) {
  float x = 200 - random(width);
  float y = 200 - random(height);
  float distance = sqrt(x*x + y*y);
  
  if (distance < 150) {
    textSize(random(10, 20));
    fill(random(50, 60), 99, 99, 80);
    text("circle", 200 + x, 200 + y);
    count++;
  }
}
