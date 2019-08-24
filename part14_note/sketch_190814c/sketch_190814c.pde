/**
 * 動画を元にドット柄に変換
 */
import processing.video.*;

Movie movie;

void setup () {
  size(400, 400);
  frameRate(60);
  background(0);
  noStroke();
  movie = new Movie(this, "movie.mov");
  movie.loop();
}

void draw () {
  image(movie, 0, 0, width, height);
  
  float step = 10;
  for (int y = 0; y < height; y += step) {
    for (int x = 0; x < width; x += step) {
      color col = get(x, y);
      fill(col);
      stroke(0);
      strokeWeight(4);
      ellipse(x, y, step, step); 
    }
  }
}

void movieEvent (Movie m) {
  m.read();
}
