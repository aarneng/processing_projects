void setup() {
  size(400, 400);
}

void draw() {
  background(220, 220, 220);
  strokeWeight(3);
  color c1 = color(0, 0, 0);
  color c2 = color(200, 0, 0);
  for(int i = 0; i < 200; i++) {
    stroke(lerpColor(c1, c2, map(i, 0, 200, 0, 1)));
    point(20 + i, 20 + i);
  }
}
