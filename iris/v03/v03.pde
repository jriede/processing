Ell[] els;
int centX, centY;
float radiusNoise;
float rad;
float lastx = -999;
float lasty = -999;
int i; // ellipse index
int maxElls = 1000;
color col;

void setup() {
  size(600, 600);
  centX = centY = 300;
  background(255);
  strokeWeight(0.5);
  smooth(3);
  noLoop();
  i = 0;
  els = new Ell[maxElls];  
}

void draw() {
  float tx, ty, tr;

  for (i = 0; i < 360; i += 2) {
    tx = 100;
    ty = 100;
    tr = (float) i;
    col = color(random(255),0,255, random(200));
    els[i] = new Ell(0,0.25*PI,1,1,50, col, tx, ty, tr);
    println(i, tx, ty, tr);
    els[i].display();
    i += 1;
  }
}

class Ell {
  color col;
  float t;
  float phi1, phi2;
  float w1, w2;
  float r;
  float x,y, txx, tyy;
  float rad;
  color coli;
  float trr;
  
  
  Ell(float p1, float p2, float we1, float we2, float radi, color c, float tx, float ty, float tr) {
    //col = color(255,0,0);
    r = radi;
    phi1 = p1;
    phi2 = p2;
    w1 = we1;
    w2 = we2;
    coli = c;
    txx = tx;
    tyy = ty;
    trr = tr;
  }
  
  void display() {

    strokeWeight(0.5);
    stroke(coli);
    pushMatrix();
    
    translate(txx, tyy);
    rotate(radians(trr));
    

    for (t = 0; t <= 2*PI; t += PI/100) {
      radiusNoise = random(2);
      rad = r + radiusNoise;
  
      x = centX + (rad*sin(w1*t + phi1));
      y = centY + (rad*sin(w2*t + phi2));
  
      if(lastx > -999) {
        line(x,y,lastx,lasty);

      }
  
      lastx = x;
      lasty = y;
   
    }
    popMatrix();

  }
  
}
