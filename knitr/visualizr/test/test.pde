void setup() {
  size(640,  480);
  background(255);
  stroke(0);
  noFill();
  smooth(1);
}

void draw() {
  
  for (int i = 1; i < 3; i += 1) {
    bezier(i*30+5, 100, i*30, 50, (i+1)*30, 50, (i+1)*30-5, 100);
  }
  noLoop();
}
