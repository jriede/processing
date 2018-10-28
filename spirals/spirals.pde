size(800,800);
background(255);
strokeWeight(0.5);
smooth();

float radius = 5;
int centX = 400;
int centY = 400;

float x,y;
float lastx = -999;
float lasty = -999;
float radiusNoise = random(10);
int startangle, endangle, anglestep;

stroke(20,40,50);

for (float i = 0; i <= 80; i += 1) {
  radiusNoise = random(10);
  radius = 5;
  stroke(random(20),random(40),random(50), random(100));
  startangle = int(random(360));
  endangle = 1440 + int(random(1440));
  anglestep = 5 + int(random(3));
  
  
  for (float ang = startangle; ang <= endangle; ang += anglestep) {
    radiusNoise += 0.25;
    radius += 0.5;
    
    float thisRadius = radius + (noise(radiusNoise) *200) - 100;
    
    float rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    if(lastx > -999) {
      line(x,y,lastx,lasty);
    }
    
    lastx = x;
    lasty = y;
  }
  
}

saveFrame("spiral-###.png");
