PImage img;
ArrayList<Circle> circles = new ArrayList<Circle>();
ArrayList<Circle> old_circles = new ArrayList <Circle>();
int size = 40;
int fails = 0;

void setup() {
  size(900,900);
  img = loadImage("smiley.png");
  img.resize(width, height);
  stroke(255);
  background(255);
}

void draw() {
  newCirc();
  if (fails >= 400) {pushOld();}
  if (size < 2) {noLoop();println("finished");}
  //for (Circle c : old_circles) {c.show(); c.grow();}
  for (Circle circ : circles) {
    for (Circle other_circ : circles) {
      if (circ != other_circ) {
        if(dist(circ.x, circ.y, other_circ.x, other_circ.y)*1.5 < circ.r + other_circ.r) {
          circ.growing = false;
          other_circ.growing = false;
          break;
        }
      }
    }
    circ.show();
    circ.grow();
  }
}


void newCirc() {
  int x = int(random(width));
  int y = int(random(height));
  color c = img.get(x, y);
  boolean add = true;
  for (Circle circ : circles) {
    if (dist(x, y, circ.x, circ.y) < circ.r*1.5) {
      add = false;
      break;
    }
  }
  if (add) {circles.add(new Circle(x, y, c, size));}
  else {fails++;}
}


void pushOld() {
  for (Circle c : circles) {
    old_circles.add(c);
  }
  circles = new ArrayList<Circle>();
  size /= 1.5;
  fails = 0;
}
