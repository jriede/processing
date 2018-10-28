Ell e1;
int centX, centY;
float radiusNoise;
float rad;
float lastx = -999;
float lasty = -999;


void setup() {
  size(600, 600);
  background(255);
  strokeWeight(0.5);
  smooth(3);
  noLoop();
  
  centX = centY = 300;
  
  e1 = new Ell(0,0.25*PI,1,1,100);

}

void draw() {
  e1.display();
}

class Ell {
  color col;
  float t;
  float phi1, phi2;
  float w1, w2;
  float r;
  float x,y;
  float rad;
  
  
  Ell(float p1, float p2, float we1, float we2, float radi) {
    //col = color(255,0,0);
    r = radi;
    phi1 = p1;
    phi2 = p2;
    w1 = we1;
    w2 = we2;
    
  }
  
  void display() {

    background(255);
    strokeWeight(0.5);

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

  }
  
}
