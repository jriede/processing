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

  for (i = 0; i < 360; i += 20) {
    tx = 100*sin(radians(i));
    ty = 100*cos(radians(i));
    tr = (float) i;
    col = color(random(255),0,255, random(200));
    
    els[i] = new Ell(20, col, tx, ty, tr);
    
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
  
  
  Ell(float radi, color c, float tx, float ty, float tr) {
    //col = color(255,0,0);
    r = radi;
    coli = c;
    txx = tx;
    tyy = ty;
    trr = tr;
  }
  
  void display() {

    strokeWeight(0.5);
    stroke(coli);
    shapeMode(CORNER);
    pushMatrix();
    translate(centX+txx, centY+tyy);
    rotate(radians(90-trr));
    ellipse(0,0,150,20);
    
    /*
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
   
    }*/
    popMatrix();

  }
  
}
