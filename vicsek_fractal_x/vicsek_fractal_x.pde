/* Vicsek fractal (x) */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  noStroke();
  fill(0);
}


void draw() {
  vfractalx(0, 0, 800, 5);
}


void vfractalx(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    square(x, y, l);
    return ;
  }

  float nl = l / 3;

  vfractalx(x     , y     , nl, n-1);
  vfractalx(x+2*nl, y     , nl, n-1);
  vfractalx(x+nl  , y+nl  , nl, n-1);
  vfractalx(x     , y+2*nl, nl, n-1);
  vfractalx(x+2*nl, y+2*nl, nl, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("vicsek_fractal_x.png");
    System.exit(0);
  }
}
