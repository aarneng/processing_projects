// from https://en.wikipedia.org/wiki/Barnsley_fern

float x = 0;
float y = 0;

void setup() {
  fullScreen();
  background(0);
}


void nextPoint() {
  float x_n;
  float y_n;
  float num = random(1);
  if (num <= 0.01) {
    x_n = 0;
    y_n = 0.16 * y;
  }
  else if (num <= 0.86) {
    x_n = 0.85*x + 0.04*y;
    y_n = -0.04*x + 0.85*y + 1.6;
  }
  else if (num <= 0.93) {
    x_n = 0.2*x - 0.26*y;
    y_n = 0.23*x + 0.22*y + 1.6;
  }
  else {
    x_n = -0.15*x + 0.28*y;
    y_n = 0.26*x + 0.24*y + 0.44;
  }
  x = x_n; y = y_n;
}


void drawPoint() {
  strokeWeight(1);
  float draw_x_at = map(x, -2.1820, 2.6558, width/2-height/2.5, width/2+height/2.5);
  float draw_y_at = map(y, 0, 9.9983, height, 0.02*height);
  stroke(map(x, -2.1820, 2.6558, 255, 10),
         map(y, 0, 9.9983, 255, 10),
         map((x+y)/2, 0, 6.3088236, 255, 10));
  point(draw_x_at, draw_y_at);
}

int j = 0;

void draw() {
  background(0);
  j++;
  for (int i = 0; i < j; i++) {
    nextPoint();
    drawPoint();  
  }
}
