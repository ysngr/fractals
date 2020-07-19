/* Sierpinski gasket */

void setup() {
  size(870, 760);
  background(240);
  noLoop();
  stroke(0);
  noFill();
}


void draw() {
  float cx = width/2, cy = 500, l = 480;
  gasket(cx, cy-l, cx-l*sqrt(3)/2, cy+l/2, cx+l*sqrt(3)/2, cy+l/2, 9);
}


void gasket(float tX, float tY, float lX, float lY, float rX, float rY, int n) {

  if ( n <= 0 ) {
    return ;
  }

  float tlX = (tX + lX) / 2;
  float tlY = (tY + lY) / 2;
  float trX = (tX + rX) / 2;
  float trY = (tY + rY) / 2;
  float lrX = (lX + rX) / 2;
  float lrY = (lY + rY) / 2;

  triangle(tlX, tlY, trX, trY, lrX, lrY);

  gasket(tX , tY , tlX, tlY, trX, trY, n-1);
  gasket(tlX, tlY, lX , lY , lrX, lrY, n-1);
  gasket(trX, trY, lrX, lrY, rX , rY , n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("gasket.png");
    System.exit(0);
  }
}
