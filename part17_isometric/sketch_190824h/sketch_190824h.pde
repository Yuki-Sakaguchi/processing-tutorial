int sizeX = 3;
int sizeY = 3;
int sizeZ = 3;
Cube cube[][][] = new Cube[sizeX][sizeY][sizeZ];
int cubeSize = 75;
color colors[] = new color[6];
int animSpeed = 50;
AnimManager anim;
 
 
void setup() {
  size(1200, 1200, P3D);
  ortho();
  sphereDetail(10);
  anim = new AnimManager(0, 50);
  colors[0] = color(3, 221, 107);
  colors[1] = color(3, 41, 107);
  colors[2] = color(3, 221, 107);
  //colors[2] = color(235, 158, 16);
  colors[3] = color(3, 41, 107);
  //colors[3] = color(214, 63, 57);
  colors[4] = color(91, 234, 170);
  colors[5] = color(91, 234, 170); //Top
  //colors[5] = color(45, 143, 148); //Top
 
  for (int x = 0; x < sizeX; x++) {
    for (int y = 0; y < sizeY; y++) {
      for (int z = 0; z < sizeZ; z++) {
        cube[x][y][z] = new Cube(new PVector(x*cubeSize, y*cubeSize, z*cubeSize), cubeSize, colors);
      }
    }
  }
 
}
 
void draw() {
  background(35);
 
  anim.run();
 
  translate(width/2 - (cubeSize*sizeX/2), height/2 - (cubeSize*sizeY/2));
 
 
  rotateX(-0.609);
  rotateY(HALF_PI/2);
 
 
  for (int x = 0; x < sizeX; x++) {
    for (int y = 0; y < sizeY; y++) {
      for (int z = 0; z < sizeZ; z++) {
 
        cube[x][y][z].run();
 
 
        //_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
 
        if (anim.play()) {
         
          switch(anim.getStep()) {
           case STEP_1:
           cube[x][y][z].step(new PVector(0, 0, z-1));
           break;
           
           case STEP_2:
           cube[x][y][z].step(new PVector(x-1, 0, 0));
           break;
           
           case STEP_3:
           cube[x][y][z].step(new PVector(0, y-1, 0));
           break;
           
           case STEP_4:
           cube[x][y][z].step(new PVector(0, 0, (z-1)*-1));
           break;
           
           case STEP_5:
           cube[x][y][z].step(new PVector((x-1)*-1, 0, 0));
           break;
           
           case STEP_6:
           cube[x][y][z].step(new PVector(0, (y-1)*-1, 0));
           break;
           }
           
          //cube[x][y][z].step(new PVector(round(random(-2, 2)), round(random(-2, 2)), round(random(-2, 2))));
        } //End anim
 
        //_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
      }
    }
  }
 
  //saveFrame("output/img####.png");
}
 
 
class AnimManager {
 
  int step;
  int speed;
  int stepMax = 6;
 
  AnimManager(int _step, int _speed) {
    step = _step;
    speed = _speed;
  }
 
  void run() {
    if (frameCount%speed == 0) {
      step++;
      step = (step > stepMax) ? 1 : step;
    }
  }
 
  int getStep() {
    return step;
  }
 
  boolean play() {
    if (frameCount%speed == 0) {
      return true;
    } else {
      return false;
    }
  }
}
 
 
class Cube {
 
  PVector pos;
  PVector target;
  int size;
  color c[] = new color[6];
  color cAlt[] = new color[6];
 
  Cube(PVector _pos, int _size, color _c[]) {
    pos = _pos.copy();
    target = pos.copy();
    size = _size;
    for (int i = 0; i < 6; i++) {
      c[i] = _c[i];
      cAlt[i] = color(red(c[i])-10, green(c[i])-10, blue(c[i])-10);
    }
  }
 
  void update() {
    if (PVector.dist(pos, target) > 0.01) {
      this.slideToward(pos, target);
    }
  }
 
  void display() {
    noStroke();
 
    pushMatrix();
    translate(pos.x-size/2, pos.y-size/2, pos.z-size/2);
    beginShape(TRIANGLES);
 
 
    fill(c[0]);
    vertex(0, 0, 0);
    vertex(0, size, 0);
    vertex(size, size, 0);
    fill(cAlt[0]);
    vertex(size, size, 0);
    vertex(size, 0, 0);
    vertex(0, 0, 0);
 
 
    fill(c[1]);
    vertex(size, 0, size);
    vertex(size, 0, 0);
    vertex(size, size, 0);
    fill(cAlt[1]);
    vertex(size, size, 0);
    vertex(size, size, size);
    vertex(size, 0, size);
 
    fill(c[2]);
    vertex(0, 0, size);
    vertex(size, 0, size);
    vertex(size, size, size);
    fill(cAlt[2]);
    vertex(size, size, size);
    vertex(0, size, size);
    vertex(0, 0, size);
 
    fill(c[3]);
    vertex(0, 0, 0);
    vertex(0, 0, size);
    vertex(0, size, size);
    fill(cAlt[3]);
    vertex(0, size, size);
    vertex(0, size, 0);
    vertex(0, 0, 0);
 
    fill(c[4]);
    vertex(0, size, 0);
    vertex(size, size, 0);
    vertex(size, size, size);
    fill(cAlt[4]);
    vertex(size, size, size);
    vertex(0, size, size);
    vertex(0, size, 0);
 
    fill(c[5]);
    vertex(0, 0, 0);
    vertex(size, 0, 0);
    vertex(size, 0, size);
    fill(cAlt[5]);
    vertex(size, 0, size);
    vertex(0, 0, size);
    vertex(0, 0, 0);
 
 
 
    endShape();
    popMatrix();
  }
 
  void run() {
    this.update();
    this.display();
  }
 
  void setPos(PVector _pos) {
    pos = _pos.copy();
  }
 
  void step(PVector _step) {
    target.x += size*int(_step.x);
    target.y += size*int(_step.y);
    target.z += size*int(_step.z);
  }
 
  void slideToward(PVector _s, PVector _d) {
    PVector s = _s.copy();
    PVector d = _d.copy();
 
    PVector dir = PVector.sub(d, s);
    float speed = map(dir.mag(), 0, 300, 0, 50); //30
    dir.normalize();
    dir.mult(speed);
    _s.add(dir);
  }
}
 
void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
 
final int STEP_1 = 1; //Expand x
final int STEP_2 = 2; //Expand z
final int STEP_3 = 3; //Expand y
 
final int STEP_4 = 4; //Retract x
final int STEP_5 = 5; //Retract z
final int STEP_6 = 6; //Retract y
