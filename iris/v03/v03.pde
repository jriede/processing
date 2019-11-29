Ell[] els;
int centX, centY;
float radiusNoise;
float rad;
float lastx = -999;
float lasty = -999;
int i; // ellipse index
int maxElls = 8000;
color col;

void setup() {
  size(600, 600);
  centX = centY = 300;
  background(255);
  strokeWeight(0.5);
  smooth(3);
  noFill();
  noLoop();
  i = 0;
  els = new Ell[maxElls];  
}

void draw() {
  float tx, ty, tr, j;


  for (i = 0; i < 10*360; i += 20) { // ellipses
    j = (float) i + random(10);
    
    tx = 150*sin(radians(j));
    ty = 150*cos(radians(j));
    tr = j;
    col = color(random(255),random(40),255, random(200,255));
    
    els[i] = new Ell(200, col, tx, ty, tr);
    
    els[i].display();
    i += 1;
  }
  
  for (i = 0; i < 2*360; i += 5) { // outer circles
    col = color(0,0,0,random(100,255));
    j = (float) i + random(10);
    tr = j;
    tx = 250*sin(radians(j));
    ty = 250*cos(radians(j));
    
    els[i] = new Ell(30, col, tx, ty, tr);
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
    ellipse(0,0,r,20+random(20));
    
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
