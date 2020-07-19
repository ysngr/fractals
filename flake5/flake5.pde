/* Pentaflake */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  noStroke();
  fill(0);
}


void draw() {
  translate(width/2, height/2);
  rotate(-HALF_PI);
  pentaflake(-20, 0, 380, 6);
}


void pentaflake(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    pentagon(x, y, l);
    return ;
  }

  final float t = 3 * PI / 10;

  float nl = l / (2*sin(t) + 1);

  pushMatrix();
  translate(x, y);
  for ( int i = 0; i < 5; i++ ) {
    rotate(TWO_PI/5);
    pentaflake(2*sin(t)*nl, 0, nl, n-1);
  }
  rotate(PI);
  pentaflake(0, 0, nl, n-1);
  popMatrix();

  return ;
}


void pentagon(float x, float y, float l) {

  beginShape();
  for ( float t = 0; t < TWO_PI; t += TWO_PI/5 ) {
    vertex(x+l*cos(t), y+l*sin(t));
  }
  endShape(CLOSE);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("pentaflake.png");
    System.exit(0);
  }
}
