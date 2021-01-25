class Circle {
  int x, y, max;
  float r = 1;
  color c;
  boolean growing = true;
  
  Circle(int _x, int _y, color _c, int _max) {
    x = _x; y = _y;
    c = _c;
    max = _max;
  }
  void show() {
    stroke(c);
    fill(c);
    ellipse(x, y, r, r);
  }
  void grow () {
    if (growing && r < max) {
      r += 0.3;
    }
  }
}
