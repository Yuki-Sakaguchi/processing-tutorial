color[][] colorList = {
  {color(241, 89, 127), color(49, 154, 158), color(248, 209, 166)},
  {color(231, 156, 16), color(29, 144, 153), color(213, 58, 51)},
  {color(59, 74, 107), color(242, 52, 87), color(241, 212, 58)},
  {color(255, 255, 255), color(12, 182, 132), color(9, 52, 69)},
  {color(4, 58, 74), color(255, 174, 115), color(225, 125, 164)}
};

int colorIndex = 0;
float objSize = 20;
boolean isDraw = true;

void setup() {
  size(500, 500);
  noStroke();
  drawTile();
}

void draw () {
  objSize = width / map(mouseX, 0, width, 5, 35); 
  if (isDraw) {
    drawTile();
    isDraw = false;
  }
}

void drawTile() {
  background(colorList[colorIndex][0]);
  for (float y = 0; y < height; y += objSize) {
    for (float x = 0; x < width; x += objSize) {
      pushMatrix();
      translate(x, y);
      if (random(0, 10) > 2) {
        fill(colorList[colorIndex][1]);
        switch((int)random(4)) {
          case 1:
            triangle(0, 0, objSize, 0, 0, objSize);
            break;
          case 2:
            triangle(0, 0, objSize, objSize, 0, objSize);
            break;
          case 3:
            triangle(objSize, 0, objSize, objSize, 0, objSize);
            break;
          default:
            triangle(0, 0, objSize, 0, objSize, objSize); 
            break;
        }
      } else {
        fill(colorList[colorIndex][2]);
        triangle(0, 0, objSize, 0, 0, objSize);
      }
      popMatrix();
    }  
  }
}

void mousePressed() {
  isDraw = true;
  redraw();
}

void keyPressed() {  
  int baseInt = 49; // キー入力「１」
  if ((int)key >= baseInt && (int)key < baseInt + colorList.length) {
    colorIndex = ((int)key - baseInt);
    isDraw = true;
    redraw();
  }
  if (key == ' '){
    saveFrame("####.png");
  }
}
