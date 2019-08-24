int rowCount = 9;
int diameter;
int mainColor;
int bgColor;

void setup() {
  size(640, 480);
  colorMode(HSB, 360, 100, 100);
  
  mainColor = color(210, 80, 80);
  bgColor = color(210, 80, 50);
  
  background(bgColor);
  noStroke();
  
  diameter = height / rowCount;
}

void draw() {
  for (int y = 0; y < rowCount; y++) {
    fill(mainColor);
    float barWidth;
    if (y % 2 == 0) {
      barWidth = width/1.4;  
    } else {
      barWidth = width/2.6;
    }
    pushMatrix();
    translate(width/2, y * diameter);
    rect(-(barWidth)/2, 0, barWidth, diameter);
    popMatrix();
  }
            
  //for (int y = 0; y < rowCount; y++) {
  //  for (int x = 0; x < width/3; x++) {
  //    if (y % 2 == 0) { 
  //      fill(mainColor);
  //      pushMatrix();
  //      translate(width/2, 0);
  //      ellipse(0 + x, y * diameter+(diameter/2), diameter, diameter);
  //      ellipse(0 - x, y * diameter+(diameter/2), diameter, diameter);
  //      popMatrix();
  //    } else {
  //      fill(mainColor);
  //      pushMatrix();
  //      translate(0, 0);
  //      ellipse(0 + x, y * diameter+(diameter/2), diameter, diameter);
  //      ellipse(width - x, y * diameter+(diameter/2), diameter, diameter);
  //      popMatrix();
  //    }
  //  }
  //}
}
