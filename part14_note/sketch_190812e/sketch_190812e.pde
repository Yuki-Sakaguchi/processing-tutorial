// https://note.mu/outburst/n/nbc2e2a0a96d9
ArrayList<Form>form = new ArrayList<Form>();

void setup() {
 size(840, 840);
 pixelDensity(2);
 smooth(8);
 frameRate(120);
 rectMode(CENTER);
 newTile();
}

void draw() {
 background(255);
 for (int i = 0; i < form.size(); i ++) {
   Form f = form.get(i);
   f.show();
   f.move();
 }
 //if(frameCount <= 60 * 60){
 //saveFrame("output/####.tif");
 //}else {
 //  exit();
 //}
}

void newTile() {
 ArrayList<Form>form = new ArrayList<Form>();
 divideRect(0, 0, width, height, 6);
}

void divideRect(float x, float y, float w, float h, int n) { 
 if (n == 0)form.add(new Form(x, y, w, h));
 n--;
 if (n>=0) {
   if (w>=h) {
     float randomW = w/2;
     divideRect(x, y, randomW, h, n);
     divideRect(x+randomW, y, w-randomW, h, n);
   }

   if (w<h) {
     float randomH = h/2;
     divideRect(x, y, w, randomH, n);
     divideRect(x, y+randomH, w, h-randomH, n);
   }
 }
}

void mousePressed() {
 form.clear();
 newTile();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#0892a5,#7fd1b9,#e56399,#de6e4b,#ffe74c};
int getCol() {
 return colors[(int)random(colors.length)];
}

class Form {
 float x, y, w, h;
 float hw, hh;
 float b;
 float t;
 color col1, col2;
 float easing ;

 Form(float x, float y, float w, float h) {
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   hw = w/2;
   hh = h/2;
   update();
   col1 = getCol();
   col2 = getCol();
 }

 void show() {
   push();
   translate(x + hw, y + hh);
   noStroke();
   fill(col1);
   rect(0, 0, w, h);

   fill(col2);
   if (b == 0) {
     rect(0, 0, w*t, h);
   } else if (b == 1) {
     rect(0, 0, w, h * t);
   } else if (b == 2) {
     rect(hw - t*hw, 0, w*t, h);
   } else if (b == 3) {
     rect(0, hh - t*hh, w, h*t);
   } else if (b == 4) {
     rect(0, 0, w*t, h*t);
   } else if (b == 5) {
     rect(hw - t*hw, hh - t*hh, w*t, h*t);
   } else if (b == 6) {
     rect(-(hw - t*hw), hh - t*hh, w*t, h*t);
   } else if (b == 7) {
     rect(hw - t*hw, -(hh - t*hh), w*t, h*t);
   } else if (b == 8) {
     rect(-(hw - t*hw), -(hh - t*hh), w*t, h*t);
   }
   pop();
 }

 void move() {
   t += (1 - t) * easing;

   if (t > 1 - easing*0.025) {
     update();
   }
 }

 void update() {
   t = 0;
   easing = random(0.02,0.08);
   b = (int)random(8);
   col1 = col2;
   col2 = getCol();
 }
}
