/* Vicsek fractal (+) */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  noStroke();
  fill(0);
}


void draw() {
  vfractalc(0, 0, width, 6);
}


void vfractalc(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    square(x, y, l);
    return ;
  }

  float nl = l / 3;

  vfractalc(x+nl  , y     , nl, n-1);
  vfractalc(x     , y+nl  , nl, n-1);
  vfractalc(x+nl  , y+nl  , nl, n-1);
  vfractalc(x+2*nl, y+nl  , nl, n-1);
  vfractalc(x+nl  , y+2*nl, nl, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("vicsek_fractal_c.png");
    System.exit(0);
  }
}
