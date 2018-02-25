
//Flower[] flowers;
Flower flower1;
Flower[] flowers;
int numPoints;

void setup()
{
  
  size(500,500); //500x500 canvas
  background(255); //black background
  numPoints = 0; //sets array
  flowers = new Flower[100];
  
}
 
void draw() {   //<>//
 //<>// //<>//
}


void mouseClicked()
{
  numPoints += 1;
  println(numPoints);
  flowers[numPoints] = new Flower(mouseX,mouseY); 
  flowers[numPoints].display();
}

class Flower {
  int x, y;
  color clr;
  float alph;
  int red, green, blue;

  
  // Contructor
  Flower(int tx, int ty) {
    red = int(random(255));
    green = int(random(255));
    blue = int(random(255));
    clr = color(red, green, blue);
    alph = int(random(255));
    x = tx;
    y = ty;
    
  }
  
  // Custom method for drawing the object
  void display() {
    
    noStroke(); 
    fill(clr, alph);
    ellipse(x, y, 30, 30);
    saveFrame();
  }
  
  void update() {
  }
}