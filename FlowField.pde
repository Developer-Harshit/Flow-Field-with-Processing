Field p ;


float fac1, fac2, zinc;
int par ;

void setup() {

  size(720, 720);

  noCursor();
  noFill();
  background(0);
  colorMode(HSB);

  p = new Field(5000);
   resetParams();
}
void draw() {


  if (frameCount % 2000 == 0) {
    resetParams();
  }


  strokeWeight(1);
  p.display(fac1, par);
  p.update(fac2, zinc);
}
void resetParams() {
  background(0);
  fac1 = random(0.000005, 0.00001);
  fac2 = random(0.001, 0.009);
  zinc = random(0.0001, 0.001);
  par = (int) random(1, 10);

  p.resetDir();
}
void mousePressed() {

  resetParams();
}
void clearCanvas() {
  push();
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  pop();
}
