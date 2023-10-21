Field p ;

//float z;
//float y;
void setup() {

  size(720, 720);

  //noCursor();
  noFill();
  background(0);
  colorMode(HSB);

  p = new Field(1000);
}
void draw() {
  strokeWeight(1);
  p.display(0.0001,10);
  p.update(0.01, 0.003);
}
//void mousePressed() {
//  background(0);
//  p.resetDir();
//}
void clearCanvas() {
  push();
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  pop();
}
