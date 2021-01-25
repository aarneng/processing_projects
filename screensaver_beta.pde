// PRINT10
int size = 30;
int howmany_x;
int howmany_y;
int x = 0;
int y = 0;
float weight1, weight2, weight3;
int r, g, b, seed;
int bg = 0;

void setup() {
  size(600, 600);
  background(0);
  howmany_x = ceil(width / size);
  howmany_y = ceil(height / size);
  weight1 = random(0.25, 1);
  weight2 = random(0.25, 1);
  weight3 = random(3)/random(1,7);
  fill(0);
}

void rerunColor() {
  weight1 = random(0.25, 1);
  weight2 = random(0.25, 1);
  weight3 = random(3)/random(1, 7);
  seed = int(random(7));
}

void setStroke() {
  if (seed == 0) {
    r = round(map(pow(map(x, 0, howmany_x, 0, 1), weight1), 0, 1, 20, 255));  // 1
    g = round(map(pow(map(y, 0, howmany_y, 0, 1), weight2), 0, 1, 20, 255));  // 2
    b = round(map(pow(map((x+y)/2, 0, howmany_x + howmany_y, 0, 1), weight3), 0, 1, 5, 255));  // 3
  }
  else if (seed == 1) {
    r = round(map(pow(map(x, 0, howmany_x, 0, 1), weight1), 0, 1, 20, 255));  // 1
    g = round(map(pow(map((x+y)/2, 0, howmany_x + howmany_y, 0, 1), weight3), 0, 1, 5, 255));  // 3
    b = round(map(pow(map(y, 0, howmany_y, 0, 1), weight2), 0, 1, 20, 255));  // 2
  }
  else if (seed == 2) {
    r = round(map(pow(map(y, 0, howmany_y, 0, 1), weight2), 0, 1, 20, 255));  // 2
    g = round(map(pow(map(x, 0, howmany_x, 0, 1), weight1), 0, 1, 20, 255));  // 1
    b = round(map(pow(map((x+y)/2, 0, howmany_x + howmany_y, 0, 1), weight3), 0, 1, 5, 255));  // 3
  }
  else if (seed == 3) {
    r = round(map(pow(map(y, 0, howmany_y, 0, 1), weight2), 0, 1, 20, 255));  // 2
    g = round(map(pow(map((x+y)/2, 0, howmany_x + howmany_y, 0, 1), weight3), 0, 1, 5, 255));  // 3
    b = round(map(pow(map(x, 0, howmany_x, 0, 1), weight1), 0, 1, 20, 255));  // 1
  }
  else if (seed == 4) {
    r = round(map(pow(map((x+y)/2, 0, howmany_x + howmany_y, 0, 1), weight3), 0, 1, 5, 255));  // 3
    g = round(map(pow(map(x, 0, howmany_x, 0, 1), weight1), 0, 1, 20, 255));  // 1
    b = round(map(pow(map(y, 0, howmany_y, 0, 1), weight2), 0, 1, 20, 255));  // 2
  }
  else if (seed == 5) {
    r = round(map(pow(map((x+y)/2, 0, howmany_x + howmany_y, 0, 1), weight3), 0, 1, 5, 255));  // 3
    g = round(map(pow(map(y, 0, howmany_y, 0, 1), weight2), 0, 1, 20, 255));  // 2
    b = round(map(pow(map(x, 0, howmany_x, 0, 1), weight1), 0, 1, 20, 255));  // 1
  }
  stroke(r, g, b);
}

void draw() {
  if (x == howmany_x) {x = 0; y++;}
  if (y == howmany_y) {delay(5000);y = 0;rerunColor();}//bg = 255 - bg;}
  int n = round(random(1));
  noStroke();
  rect(size*(x), size*(y), size, size);

  setStroke();
  line(size*(x+n), size*(y), size*(x+(1-n)), size*(y+1));
  x++;
}
