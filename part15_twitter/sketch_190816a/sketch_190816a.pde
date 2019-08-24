/**
 * カラフルなドットのアニメーション
 * 色が重なると黒くなる
 */
int diameter = 25;
int offset = diameter;

ArrayList<Circle> red = new ArrayList<Circle>();
ArrayList<Circle> blue = new ArrayList<Circle>();
ArrayList<Circle> yellow = new ArrayList<Circle>();

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  background(360);
  noStroke();
  
  for (int y = -(diameter + offset); y < height + (diameter + offset); y += diameter + offset) {
    for (int x = -(diameter + offset); x < width + (diameter + offset); x += diameter + offset) {
      Circle cr = new Circle(x + (diameter/2), y + (diameter/2));
      cr.diameter = diameter;
      cr.col = color(120, 80, 60);
      red.add(cr);
      
      Circle cb = new Circle(x + (diameter/2) + diameter, y + (diameter/2));
      cb.diameter = diameter;
      cb.col = color(360, 80, 60);
      blue.add(cb);
  
      Circle cy = new Circle(x + (diameter/2) + diameter + diameter, y + (diameter/2) + diameter);
      cy.diameter = diameter;
      cy.col = color(240, 80, 60);
      yellow.add(cy);
    }
  }
}

void draw() {
  background(360);
  blendMode(SUBTRACT);
   
  for (int r = 0; r < red.size(); r++) {
    red.get(r).draw(0);
  }
  
  for (int b = 0; b < blue.size(); b++) {
    blue.get(b).draw(1); 
  }
  
  for (int g = 0; g < yellow.size(); g++) {
    yellow.get(g).draw(2); 
  }
}

class Circle {
  float defaultX, defaultY, x, y, diameter;
  color col;
  
  Circle(float _x, float _y) {
     defaultX = x = _x;
     defaultY = y = _y;
  }
  
  void draw (int type) {
    fill(col);
    ellipse(x, y, diameter, diameter);
    float point = 0.8;

    if (type == 1) {
      x += point*1.5;
      if (defaultX + (diameter*2) + (offset*2) < x + diameter + offset) {
        x = defaultX;
        y = defaultY;
      }
    } else if (type == 2) {
      y -= point*1.5;
      if (defaultY - (diameter*2) - (offset*2) > y - diameter - offset) {
        x = defaultX;
        y = defaultY;
      }
    } else {
      x += point;
      y += point;
      if (defaultX + (diameter*2) + (offset*2) < x + diameter + offset) {
        x = defaultX;
        y = defaultY;
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("####.png");
  }
}
