/**
 * 3Dのボックスが円を描きながら回転しつつこっちにくる
 */

float t, r;
float d = 9;

void setup() {
  size(400, 400, P3D); 
}

void draw() {
  clear();
  for (r = 0; r < TAU * d; r += PI/8) {
    translate(cos(r + t) * 50,
              sin(r + t) * 50,
              -500 + r * 10 + tan(t) * 100);
    rotateY(t += 0.0001);
    box(12);
    resetMatrix();
  }
}

void mousePressed() {
  d += 9;
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
    d = 9;
  }
}
