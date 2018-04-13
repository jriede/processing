
Flower[] flowers;
int i; //flower id
int maxFlowers = 1000;

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
  int x, y;
  float angle;
  color clr;
  float alph;
  int red, green, blue;
  float dx,dy;
  float len = 100;
  float x2,y2;
  float dpi = 0.3;

  
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
    dx = sin(angle)*len;
    dy = cos(angle)*len;
    
    x2 = x + dx;
    y2 = y + dy;
    
    println(x2);
    
    
  }
  
  // Custom method for drawing the object
  void display() {
    
    noStroke(); 
    fill(clr, alph);
    ellipse(x, y, 2, 2);
    stroke(2);
    line(x,y,x2,y2);
    noStroke(); 
    ellipse(x2, y2, 20, 20);
    saveFrame("flowers-01-###.png");
  }
  
  void update() {
  }
}