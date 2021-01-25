class Circle {
  float x, y;
  int r;
  Circle() {
    x = 10000;
    y = 10000;
    r = 5;
  }
  
  void initMe() {
    boolean rand = boolean(int(random(2)));
    if (rand) {
      x = random(width);
      y = int(random(2)) * height;
    } else {
      x = int(random(2)) * width;
      y = random(height);
    }
  }
  void drawMe() {
    if (x < width) {
      color draw = lerpColor(color(0, 255, 0), color(255, 0, 0), pow(map(dist(x, y, width/2, height/2), 0, dist(0, 0, width/2, height/2), 0, 1), 1/4.));
      //println(draw);
      stroke(draw);
      fill(draw);
      ellipse(x, y, r, r);
    }
  }
  void updateMe() {
    double multBy = 5/(dist(x, y, width/2, height/2));
    double deltaX = (x-width/2)/abs(x-width/2) * dist(x, 0, width/2, 0) * multBy;
    x -= deltaX;
    double deltaY = (y-height/2)/abs(y-height/2) * dist(y, 0, height/2, 0) * multBy;
    y -= deltaY;
  }
}

Circle[] circles = new Circle[500];
int amtCircles = 0;

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  for (int i = 0; i < 500; i++) {
    circles[i] = new Circle();
  }
  circles[amtCircles].initMe();
  circles[amtCircles].updateMe();
  
  while (dist(circles[amtCircles].x, circles[amtCircles].y, width/2, height/2) > 5) {
    circles[amtCircles].updateMe();
  }
  amtCircles++;
  circles[amtCircles].initMe();
  frameRate(1000);
}

void draw() {
  clear();
  Circle currentCircle = circles[amtCircles];
  circles[amtCircles].updateMe();
  for (int i = 0; i < amtCircles; i++) {
    Circle other = circles[i];
    if (dist(currentCircle.x, currentCircle.y, other.x, other.y) < 9 || 
       dist(currentCircle.x, currentCircle.y, width/2, height/2) < 9) {
      circles[++amtCircles].initMe();
      if (amtCircles == 499) {
        println("finished");
        noLoop();
      }
      break;
    }
  }
  for (Circle c : circles) c.drawMe();
}
