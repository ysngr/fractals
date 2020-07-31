/* Koch curve */

void setup() {
  size(920, 450);
  background(240);
  noLoop();
}


void draw() {
  translate(width/2, height/2);
  rotate(PI);
  translate(-width/2, -height/2);
  kochcurve(0, 100, width, 100, 7);
}


void kochcurve(float lx, float ly, float rx, float ry, int n) {

  if ( n <= 0 ) {
    line(lx, ly, rx, ry);
    return ;
  }

  final float c = sqrt(3) / 2;
  
  float dx = (rx - lx) / 3;
  float dy = (ry - ly) / 3;
  float cx = (lx + rx) / 2;
  float cy = (ly + ry) / 2;

  kochcurve(lx     , ly     , lx+dx  , ly+dy  , n-1);
  kochcurve(lx+dx  , ly+dy  , cx-c*dy, cy+c*dx, n-1);
  kochcurve(cx-c*dy, cy+c*dx, rx-dx  , ry-dy  , n-1);
  kochcurve(rx-dx  , ry-dy  , rx     , ry     , n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("koch_curve.png"); 
    System.exit(0);
  }
}
