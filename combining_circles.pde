int count = 400;
ArrayList<Circle> circles = new ArrayList<Circle>();

void setup() {
  size(1000, 1000);
  background(0);
  ellipseMode(RADIUS);
  for (int i = 1; i < count; i++) {
    Circle circle = new Circle(int(random(width)), int(random(height)), 10);
    circles.add(circle);
  }
}

void draw() {
  clear();
  for (int i = 0; i < circles.size(); i++) {
    Circle c = circles.get(i);
    for (int j = i + 1; j < circles.size(); j++) {
      if (c.touching(circles.get(j))) {
        Circle cc = circles.get(j);
        c.update(combine(c, cc));
        circles.remove(j);
      }
    }
    c.drawMe();
  }
  for (Circle c : circles) {
    float dx = c.centerX - width/2;
    float dy = c.centerY - height/2;
    float dist = sqrt(sq(dy) + sq(dx)) * 10;
    dx /= dist;
    dy /= dist;
    c.move(random(-3, 3) - dx, random(-3, 3) - dy);
  }
}

Circle combine(Circle c1, Circle c2) {
  float newR = sqrt(sq(c1.radius)+sq(c2.radius));
  float sumRadii = sq(c1.radius) + sq(c2.radius);
  float newX = (c1.centerX * sq(c1.radius) + c2.centerX * sq(c2.radius)) / sumRadii;
  float newY = (c1.centerY * sq(c1.radius) + c2.centerY * sq(c2.radius)) / sumRadii;
  
  return new Circle(newX, newY, newR);
}

class Circle {
  float centerX, centerY;
  float radius;
  Circle(float cx, float cy, float r) {
    centerX = cx;
    centerY = cy;
    radius = r;
  }
  
  boolean touching(Circle other) {
    float distance = sq(this.centerX - other.centerX) + sq(this.centerY - other.centerY);
    float radiiDist = sq(this.radius + other.radius);
    
    return distance < radiiDist;
  }
  
  void update(Circle c) {
    this.centerX = c.centerX;
    this.centerY = c.centerY;
    this.radius = c.radius;
  }
  
  void move(float dx, float dy)  {
    this.centerX += dx;
    this.centerY += dy;
  }
  
  void drawMe() {
    stroke(255);
    circle(centerX, centerY, radius);
  }
}
