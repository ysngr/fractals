/* Octoflake */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  noStroke();
  fill(0);
}


void draw() {
  octaflake(width/2, height/2, 360, 5);
}


void octaflake(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    octagon(x, y, l);
    return ;
  }

  final float T = 3 * PI / 8;

  float nl = l * cos(T) / (sin(T) + cos(T));
  float dl = l - nl;

  for ( float t = 0; t < TWO_PI; t += TWO_PI/8 ) {
    octaflake(x+dl*cos(t), y+dl*sin(t), nl, n-1);
  }

  return ;
}


void octagon(float x, float y, float l) {

  beginShape();
  for ( float t = 0; t < TWO_PI; t += TWO_PI/8 ) {
    vertex(x+l*cos(t), y+l*sin(t));
  }
  endShape(CLOSE);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("octoflake.png");
    System.exit(0);
  }
}
