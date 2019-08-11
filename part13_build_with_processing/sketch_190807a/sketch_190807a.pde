float[] diameter = {50, 100};
float angle = 0;

void setup () {
  size(400, 400, P3D);
  background(0);
}

void draw () {
  background(0);
  
  ambientLight(20, 20, 20);
  lightSpecular(255, 255, 255);
  directionalLight(100, 100, 100, 0, 1, -1);
  
  float d1 = 10 + (sin(angle + PI/2) * diameter[0]/2) + diameter[0]/2;
  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  specular(255, 255, 255);
  shininess(0);
  sphere(d1);
  popMatrix();

  angle += 0.05;
}
