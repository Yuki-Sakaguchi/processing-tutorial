// https://note.mu/outburst/n/n18f7a78cdc0c
void setup() {
 size(840, 840);
 pixelDensity(2);
 noLoop();
}

void draw() {
 background(255);
 waves();
 tile(0, 0, width);
}

void waves() {
 strokeWeight(2);

 for (float y=0; y<height*2; y+=100) {
   color c1 = getCol(), c2 = getCol();
   for (float x=0; x<=width; x+=1) {
     color col = lerpColor(c1, c2, x/width);

     stroke(col);
     line(x, height, x, y * noise(x * 0.001, y * 0.0005));
   }
 }
}

void tile(float x_, float y_, float w_) {
 int tileCount = (int)random(2, 6);
 float tileWidth = w_/tileCount;
 float min = 100;
 float hw = tileWidth/2;

 for (float x = x_; x < x_ + w_ -1; x += tileWidth) {
   for (float y = y_; y < y_ + w_ - 1; y += tileWidth) {
     if (random(1) < 0.5 && tileWidth > min) {
       tile(x, y, tileWidth);
     } else {
       fill(getCol());
       noStroke();

       if (random(1) < 0.1) {
         beginShape();
         vertex(x+hw, y);
         vertex(x+tileWidth, y+hw);
         vertex(x+hw, y+tileWidth);
         vertex(x, y+hw);
         endShape();
       } else if (random(1) < 0.2) {
         circle(x+hw, y+hw, tileWidth * 0.95);
       }
     }
   }
 }
}

void mousePressed() {
 redraw();
 noiseSeed((int)random(10000));
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#0c090d, #e07491, #f2897b, #f9d87c, #6ab8cc, #F9BD7C};
int getCol() {
 return colors[(int)random(colors.length)];
}
