int i,j;
float angle, dx, dy;
float centX, centY;
float r;

void setup() {
  size(600, 600);
  centX = centY = 300;
  background(255);
  strokeWeight(0.5);
  smooth(3);
  noFill();
  noLoop();
  i = 0;
}

void draw() {
  dx = 3;
  dy = 3;
  r = 50;
  float x,y, lastX, lastY, my, maxX;
  color col;
  
  for (j=0; j<= 1000; j++) {
    col = color(0,0,0, random(2,200));
    stroke(col);
    angle = random(360);
    pushMatrix();
    translate(centX + r*cos(radians(angle)), centY+ r*sin(radians(angle)));
    
    rotate(radians(angle));
    maxX = random(10, 0.5*centX);
    lastX = 0;
    lastY = 0;
    y = random((-1)*dy, dy);
  
    for (x = dx; x < maxX; x = x + random(dx)) {
      y = y + random((-1)*dy, dy);
      line(lastX, lastY, x,y);
      lastX = x;
      lastY = y;
    }
    popMatrix();
  }
}
