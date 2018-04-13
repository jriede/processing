
Flower[] flowers;
int i; //flower id
int maxFlowers = 1000;
float xoff = 0.0;

void setup()
{
  
  size(1024,768); //500x500 canvas
  background(255); //black background
  i = 0; // start with flower id 0
  flowers = new Flower[maxFlowers];
  
}
 
void draw() {   //<>// //<>//
}


void mouseClicked()
{
  i += 1;
  println(i);
  flowers[i] = new Flower(mouseX,mouseY); 
  flowers[i].display();
}

class Flower {
  float x, y;
  float angle;
  color clr;
  float alph;
  int red, green, blue;
  float dx,dy;
  float len = 200;
  float x2,y2;
  float dpi = 0.3;
  float xnoise = random(10);
  float ynoise = random(10);
  float xstep, ystep;
  float xtemp, ytemp;
  int i;
  float div = 15;
  

  
  // Contructor
  Flower(int tx, int ty) {
    red = int(random(255));
    green = int(random(255));
    blue = int(random(255));
    clr = color(red, green, blue);
    alph = int(random(255));
    x = tx;
    y = ty;
    
    angle = random(PI-dpi,PI+dpi);
    
    
  }
  
  // Custom method for drawing the object
  void display() {
    
    noStroke(); 
    fill(clr, alph);
    ellipse(x, y, 5, 5);
    
    xtemp = x;
    ytemp = y;
    println(xtemp);
    println(ytemp);
    noStroke(); 
    
    for (i=0; i < div; i ++) {
      stroke(2);
      dx = sin(angle)*len/div;
      dy = cos(angle)*len/div;
    
      x2 = x + dx + random(-10,10)*noise(30);
      y2 = y + dy;
      
      //float n = noise(i);
      //line(n, 0, n, height);
    
      line(x,y,x2,y2);
      x = x2;
      y = y2;
    }
 
    //line(x,y,x2,y2);
    noStroke(); 
    ellipse(x2, y2, 20, 20);
    //saveFrame("flowers-01-###.png");
  }
  
  void update() {
  }
}