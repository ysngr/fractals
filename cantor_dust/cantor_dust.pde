/* Cantor dust */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  noStroke();
  fill(0);
}


void draw() {
  final float d = 10;
  cantordust(d, d, width-2*d, 6);
}


void cantordust(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    square(x, y, l);
    return ;
  }

  float nl = l / 3;

  cantordust(x     , y     , nl, n-1);
  cantordust(x+2*nl, y     , nl, n-1);
  cantordust(x     , y+2*nl, nl, n-1);
  cantordust(x+2*nl, y+2*nl, nl, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("cantordust.png");
    System.exit(0);
  }
}
