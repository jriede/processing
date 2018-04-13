Stem[] stems;
Flower[] flowers;
Centre[] centres;
Petal[] petals;
float[] coords;

int i; //flower id
int maxFlowers = 1000;
float xoff = 0.0;

void setup()
{

  size(500,500); //500x500 canvas
  background(255); //black background
  i = 0; // start with flower id 0
  flowers = new Flower[maxFlowers];
  stems = new Stem[maxFlowers];
  centres = new Centre[maxFlowers];
  petals = new Petal[maxFlowers];

  coords = new float[2];

}

void draw() {   //<>// //<>//
}


void mouseClicked()
{
  i += 1;
  float[] temp;
  float stemLen;
  println(i);
  //flowers[i] = new Flower(mouseX,mouseY);
  //flowers[i].display();

  stems[i] = new Stem(mouseX,mouseY);
  stems[i].display();

  temp = stems[i].end();
  stemLen = stems[i].stemLength();

  centres[i] = new Centre(temp[0],temp[1],stemLen);
  centres[i].display();

  //saveFrame("yayflowers-###.png");
}

class Flower {
  float x, y;
  float angle;
  color clr;
  float alph;
  int red, green, blue;
  float dx,dy;
  float len;
  float x2,y2;
  float dpi = 0.3;
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
    len = random(100,200);

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

      line(x,y,x2,y2);
      x = x2;
      y = y2;
    }

    //line(x,y,x2,y2);
    noStroke();
    ellipse(x2, y2, 20, 20);
    //saveFrame("yayflowers-###.png");
  }

  void update() {
  }


}

class Stem {
  int i,red,green,blue;
  color clr;
  int alph;
  float x,y,x2,y2;
  float dx,dy;
  float len;
  float dpi = 0.3;
  float xstep, ystep;
  float xtemp, ytemp;
  float div = 15;
  float angle;
  float[] start = new float[2];
  float[] end = new float[2];
  float stemlen;

  Stem(int tx, int ty) {
    stemlen = len;
    red = int(random(255));
    green = int(random(255));
    blue = int(random(255));
    clr = color(red, green, blue);
    alph = int(random(255));
    x = tx;
    y = ty;
    angle = random(PI-dpi,PI+dpi);
    len = random(100,200);
    this.start[0] = x;
    this.start[1] = y;

  }

  void display() {
    noStroke();
    fill(clr, alph);
    ellipse(x, y, 5, 5);

    xtemp = x;
    ytemp = y;
    println(xtemp);
    println(ytemp);
    noStroke();
    beginShape();
    noFill();
    line(x,y,xtemp,ytemp);

    curveVertex(xtemp,ytemp);

    for (i=0; i < div; i ++) {
      stroke(2);
      dx = sin(angle)*len/div;
      dy = cos(angle)*len/div;

      x2 = x + dx + random(-10,10)*noise(20);
      y2 = y + dy;

      line(x,y,x2,y2);
      //curveVertex(x2,y2);
      x = x2;
      y = y2;
    }

    //line(x,y,x2,y2);
    endShape();
    noStroke();
    fill(clr, alph);
    ellipse(x2, y2, 20, 20);
    this.end[0] = x2;
    this.end[1] = y2;

  }

  float[] start() {
    return this.start;
  }

  float[] end() {
    return this.end;
  }

  float stemLength() {
    return this.len;
  }
}

class Centre {
  // center of the flower.
  float x,y,r;
  int corners;
  float[][] coords;
  float rmin;
  float rmax;
  int i;
  float angle = 0;
  float angle2 = 0;
  float xtemp,ytemp;
  float x1,y1,x2,y2;
  float stemlen;

  Centre(float tx, float ty, float len) {
    x = tx;
    y = ty;
    xtemp = x;
    ytemp = y;
    stemlen = len;
    rmin = 0.05*stemlen;
    rmax = 0.25*stemlen;

    r = random(rmin, rmax);
    corners = int(random(5,8));
    coords = new float[corners+2][2];
    stroke(1);
    fill(2);

    // generate corner coordinates


  }

  void display() {

    angle = 0;
    float x0,y0;
    x0 = x+r*sin(angle)+ random(0,5);
    y0 = y+r*cos(angle)+ random(0,5);
    xtemp = x0;
    ytemp = y0;
    ellipse(x0,y0,3,3);

    for (i=1;i<=corners;i++) {
      angle = i * TWO_PI/float(corners);

      x1 = xtemp;
      y1 = ytemp;

      x2 = x+r*sin(angle) + random(0,5);
      y2 = y+r*cos(angle) + random(0,5);

      line(x1,y1,x2,y2);
      ellipse(x1,y1,8,8);

      xtemp = x2;
      ytemp = y2;

      // generate petal
      petals[i-1] = new Petal(x1,y1,x2,y2);
      println(x1,y1,x2,y2);
      petals[i-1].display();

    }
    //line(xtemp,ytemp,x0,y0);
    //ellipse(xtemp,ytemp,3,3);

  }

  float[][] coordinates() {
    return coords;
  }

}

class Petal {

  float corners = 3;
  //float[][] coords;
  float[][] coords = new float[int(corners)][2];
  float[] foo = new float[2];
  float len;



  Petal(float x1, float y1, float x2, float y2) {
    
    float dx = x2 - x1;
    float dy = y2 - y1;
    len = sqrt(dx*dx + dy*dy);
    
     coords[0][0] = x1;
     coords[0][1] = y1;

     coords[1][0] = x2;
     coords[1][1] = y2;

     coords[2][0] = x1 + dx/2.0;
     coords[2][1] = y1 + dy/2.0;
     
     foo = this.normal(x1,y1,x2,y2);
 
     
     println(dx,dy,foo[0],foo[1]);
     //println(coords[2][0],coords[2][1]);


  }

  void display() {
    stroke(1);
    fill(color(0,255,0));
    ellipse(coords[2][0],coords[2][1],2,4);
    ellipse(coords[2][0]+foo[0]*len,coords[2][1]+foo[1]*len,4,2);

    line(coords[0][0],coords[0][1], coords[2][0]+foo[0]*len,coords[2][1]+foo[1]*len);
  }

  float[] normal(float x1, float y1, float x2, float y2) {
    float[] foo = new float[2];
    float dx = x2 - x1;
    float dy = y2 - y1;
    
    float len = sqrt(dx*dx + dy*dy);
    //foo[0] = (-1.0*dy)/len;
    //foo[1] = (dx)/len;
    foo[0] = (-1.0*dy)/len;
    foo[1] = (dx)/len;
    return foo;
  }

}