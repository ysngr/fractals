/* Sierpinski carpet */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  noStroke();
  fill(128);
}


void draw() {
  carpet(0, 0, width, 7);
}


void carpet(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    return;
  }

  float nl = l / 3;

  square(x+nl, y+nl, nl);

  carpet(x     , y     , nl, n-1);
  carpet(x+nl  , y     , nl, n-1);
  carpet(x+2*nl, y     , nl, n-1);
  carpet(x     , y+nl  , nl, n-1);
  carpet(x+2*nl, y+nl  , nl, n-1);
  carpet(x     , y+2*nl, nl, n-1);
  carpet(x+nl  , y+2*nl, nl, n-1);
  carpet(x+2*nl, y+2*nl, nl, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("carpet.png");
    System.exit(0);
  }
}
