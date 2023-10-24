class Field {
  PVector[] particles;
  int n;
  int xDir;
  int yDir;
  float z;
  float z2;


  OpenSimplexNoise opnoise;
  Field(int in) {

    resetDir();
    z = random(-100000, 100000);
    z2 = random(- 100000, 100000);
    long seed = (long)random(-1000000, 1000000);
    opnoise = new OpenSimplexNoise(seed);
    n = in;

    particles = new PVector[n];
    for (int i = 0; i< n; i++) {
      particles[i] = new PVector(random(0, width), random(0, height));
    }
  }

  void update(float fac, float inc) {

    for (int i = 0; i< n; i++) {
      PVector p =particles[i];
      edge(p);
      float k = findNoise(p, fac);
      p.x += cos(k)*xDir;
      p.y +=sin(k)*yDir;
    }
    z+=inc;
  }
  void update(float inc) {
    float fac = 0.007;
    for (int i = 0; i< n; i++) {
      PVector p =particles[i];
      edge(p);
      float k = findNoise(p, fac);
      p.x += cos(k)*xDir;
      p.y +=sin(k)*yDir;
    }
    z+=inc;
  }
  void update() {
    float fac = 0.005;
    for (int i = 0; i< n; i++) {
      PVector p =particles[i];
      edge(p);
      float k = findNoise(p, fac);
      p.x += cos(k)*xDir;
      p.y +=sin(k)*yDir;
    }
    z+=0.01;
  }
  void display() {
    clearCanvas();

    float fac =0.0001;
    for (int i = 0; i< n; i++) {
      PVector p =particles[i] ;
      //setHue(p, fac, 255);
      stroke(210,260,260);
      point(p.x, p.y);
    }
    z2+=0.0001;
  }
  void display(float fac, int alpha) {
    
    for (int i = 0; i< n; i++) {
      PVector p =particles[i] ;
      setHue(p, fac,alpha);
      point(p.x, p.y);
    }
    z2+=0.001;
  }

  void display(int alpha) {
    float fac =0.0001;
    for (int i = 0; i< n; i++) {
      PVector p =particles[i] ;
      //setHue(p, fac, alpha);
      stroke(120,260,190,alpha);
      point(p.x, p.y);
    }
  }

  void edge(PVector p) {

    if ( p.x <-10) {
      p.x = width;
    } else if (p.x >width+10) {
      p.x = 0;
    }
    if (p.y <=-10) {
      p.y = height;
    } else if (p.y >height+10) {
      p.y = 0;
    }
  }

  void setHue(PVector p, float fac, float alpha) {

    float k = (float) opnoise.eval(p.x*fac, p.y*fac, z2);
    k = map(k, -1, 1, 0, 360);
    if (alpha == 0) {
      stroke(k, 210, 260);
    } else stroke(k, 210, 260, alpha);
  }
  float findNoise(PVector p, float fac) {
    float k = (float) opnoise.eval(p.x*fac, p.y*fac, z);
    return map(k, -1, 1, 0, TAU);
  }
  void resetDir() {
    long seed = (long)random(-1000000, 1000000);
    opnoise = new OpenSimplexNoise(seed);
    xDir = 1;
    yDir = 1;
   
    float k= random(-1, 1);
    if (k < 0) xDir = -1;

    k= random(-1, 1);
    if (k < 0) yDir = -1;
  }
}
