class Particle {
  int x, y;
  int cx, cy;
  float r = 1;
  boolean moving = true;
  
  Particle(float _x, float _y, int _cx, int _cy) {
    x = int(_x); y = int(_y);
    cx = _cx; cy = _cy;
  }
  
  void move() {
    if (moving) {
      if (x < cx) {x++;} else if (x > cx) {x--;}
      if (y < cy) {y++;} else if (y > cy) {y--;}
      moving = !(x == cx && y == cy);
    }
  }
  
  void show() {
    if ( r > 1) {drawGradient();}
    else {
      stroke(map(dist(x,y,cx,cy), 0, 650, 255, 0));
      ellipse(x,y,r,r);
    }
  }
  
  void drawGradient() {
    ellipseMode(RADIUS);
    for (int i = int(r); i > 0; --i) {
      color c = lerpColor(color(255,0,0), color(255,200,150),map(i, 0, r, 0, 1));
      stroke(c); fill(c);
      ellipse(cx,cy,i,i);
    }
  }
}
