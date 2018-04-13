
Flower[] flowers;
int corners_min = 5;
int corners_max = 8;

int i; //flower id
int maxFlowers = 1000;

void setup()
{

  size(500,500); // canvas size
  background(255);
  i = 0; // start with flower id 0
  
  flowers = new Flower[maxFlowers];
  
}

void draw() {   //<>// //<>//
}


void mouseClicked()
{
  
  //println(i);
  flowers[i] = new Flower(mouseX,mouseY);
  flowers[i].display();
  
  i += 1;

  //saveFrame("yayflowers-###.png");
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
  private float[] end = new float[2];
  float stemlen;

  public Stem(float tx, float ty) {
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
    this.setEnd(x2, y2);

  }

  public float[] start() {
    return start;
  }

  public float[] getEnd() {

    return end;
  }
  
  public void setEnd(float ix, float iy) {

    this.end[0] = ix;
    this.end[1] = iy;

  }

  public float stemLength() {
    return len;
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
  float x0,y0;
  float stemlen;
  float[][] petalPoints = new float[corners_max+2][2];

  Petal pet;

  Centre(float tx, float ty, float len) {
    x = tx;
    y = ty;
    xtemp = x;
    ytemp = y;
    stemlen = len;
    rmin = 0.05*stemlen;
    rmax = 0.25*stemlen;

    r = random(rmin, rmax);
    corners = int(random(corners_min,corners_max));
    coords = new float[corners+1][2];


    // generate corner coordinates
    angle = 0;
    x0 = x+r*sin(angle)+ random(0,5);
    y0 = y+r*cos(angle)+ random(0,5);
    xtemp = x0;
    ytemp = y0;

    coords[0][0] = x0;
    coords[0][1] = y0;
    

    for (i=1;i<corners;i++) {
      angle = i * TWO_PI/float(corners);

      x1 = xtemp;
      y1 = ytemp;

      x2 = x+r*sin(angle) + random(0,5);
      y2 = y+r*cos(angle) + random(0,5);

      coords[i][0] = x2;
      coords[i][1] = y2;

      xtemp = x2;
      ytemp = y2;
    }
    
    this.setCoords(coords);
    this.makePetals(coords);


  }
  
  void makePetals(float[][] coords) {
    println("coords lenght: ",coords.length);

    float[] temp;
    println(coords[0][0], coords[0][1], coords[1][0], coords[1][1]);
    
    pet = new Petal(coords[0][0], coords[0][1], coords[1][0], coords[1][1]);
    
    temp = pet.getTip();
    println(temp[0]);
    petalPoints[0][0] = temp[0];
    petalPoints[0][1] = temp[1];
    
    for (int i = 1; i < coords.length-1; i++) {
      println(i);
      pet = new Petal(coords[i-1][0], coords[i-1][1], coords[i][0], coords[i][1]);
      temp = pet.getTip();
      println(temp[0]);
      petalPoints[i][0] = temp[0];
      petalPoints[i][1] = temp[1];
    }
    println(i);
    pet = new Petal(coords[i][0], coords[i][1], coords[0][0], coords[0][1]);
    
    temp = pet.getTip();
    println("last one: ", temp[0]);
    petalPoints[i][0] = temp[0];
    petalPoints[i][1] = temp[1];
    
  }

  void display() {
    stroke(1);
    fill(i*2);

    ellipse(coords[0][0],coords[0][1],4,4);
    ellipse(petalPoints[0][0], petalPoints[0][1], 1,1);
    
    for (i=1;i<corners;i++) {
      angle = i * TWO_PI/float(corners);

      x1 = coords[i-1][0];
      y1 = coords[i-1][1];

      x2 = coords[i][0];
      y2 = coords[i][1];

      line(x1,y1,x2,y2);
      ellipse(x2,y2,2,2);
      
      ellipse(petalPoints[i][0], petalPoints[i][1], i,i);

    }
    
    x1 = coords[i][0];
    y1 = coords[i][1];

    x2 = coords[0][0];
    y2 = coords[0][1];
      
    //line(x1,y1,x2,y2);
    ellipse(petalPoints[i][0], petalPoints[i][1], 1,2);


  }

  public float[][] getCoords() {
    return coords;
  }
  
  public void setCoords(float[][] coordis) {
    this.coords = coordis;
  }

}

class Petal {

  float corners = 3;
  //float[][] coords;
  float[][] coords = new float[int(corners)][2];
  float[] foo = new float[2];
  float len;
  float[] tipCoords = new float[2];
  

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
     
     //this.setTip(coords[2][0],coords[2][1]);
     
     foo = this.normal(x1,y1,x2,y2);
     //println("normals: ", foo[0], foo[1]);
     
     this.setTip(coords[2][0]+foo[0]*len,coords[2][1]+foo[1 ]*len);


  }
  
  void setTip(float x, float y) {
    println("setting tip at ", x,y);
    this.tipCoords[0] = x;
    this.tipCoords[1] = y;
  }
  
  float[] getTip() {
    return this.tipCoords;
  }

  void display() {
    stroke(1);
    fill(color(0,255,0));
    //ellipse(coords[2][0],coords[2][1],2,4);
    //ellipse(coords[2][0]+foo[0]*len,coords[2][1]+foo[1]*len,4,2);

    //line(coords[0][0],coords[0][1], coords[2][0]+foo[0]*len,coords[2][1]+foo[1 ]*len);
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

class Flower {
  float x, y; // stem starting point
  float angle; // angle of stem from starting point
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
  
  float[] temp;
  float stemLen;
  
  Centre centre;
  Stem stem;
  Petal[] petals;

  

  // Contructor
  Flower(int tx, int ty) {
    // color vars
    red = int(random(255));
    green = int(random(255));
    blue = int(random(255));
    clr = color(red, green, blue);
    alph = int(random(255));

    // initial position
    x = tx;
    y = ty;
    
    // stem length
    len = random(100,200);

    angle = random(PI-dpi,PI+dpi);
    stem = new Stem(x,y);
    
    stem.display();
    temp = stem.getEnd();
    stemLen = stem.stemLength();
    centre = new Centre(temp[0],temp[1],stemLen);
    //println(temp[0],temp[1],stem.getEnd());
   
  }

  // Custom method for drawing the object
  void display() {
    
    
    centre.display();
    
    //saveFrame("yayflowers-###.png");
  }


}