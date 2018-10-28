float t;
float phi1, phi2;
float w1, w2;
float x,y,i;
int centX, centY;

float lastx = -999;
float lasty = -999;

size(600, 600);
centX = centY = 300;
float r = 100;
float radiusNoise;

t = 0;
background(255);
strokeWeight(0.5);
smooth();

w1 = 1.0;
w2 = 1.0;
phi1 = 0;
phi2 = 0.25*PI;
float rad;

for (t = 0; t <= 2*PI; t += PI/180.0) {
  radiusNoise = random(3);
  rad = r + radiusNoise;
  
  x = centX + (rad*sin(w1*t + phi1));
  y = centY + (rad*sin(w2*t + phi2));
  
  if(lastx > -999) {
    line(x,y,lastx,lasty);
  }
  
  lastx = x;
  lasty = y;
}
