void setup() {
  fullScreen();
  color(220, 220, 220);
  float angle_even = PI/36;
  float angle_odd = -PI/18;
  for (int j = 10; j < 100; j++) {
    int n = 0;
    int i = j;
    float tot_angle = PI/2;
  int len = 10;
  float x1 = width / 2;
  float y1 = height;
  float x2;
  float y2;
    while (i != 1) {
      n+=2;
      if (i % 2 == 0) {
        i /= 2;
        stroke(10*n, 0, 0);
        tot_angle += angle_even;
        x2 = cos(tot_angle)*len + x1;
        y2 = y1 - sin(tot_angle)*len;
        line(x1,y1, x2, y2);
        x1 = x2;
        y1 = y2;
      }
      else {
        i = 3*i + 1;
        stroke(10*n, 0, 0);
        tot_angle += angle_odd;
        x2 = cos(tot_angle)*len + x1;
        y2 = y1 - sin(tot_angle)*len;
        line(x1,y1, x2, y2);
        x1 = x2;
        y1 = y2;
        stroke(10*n, 0, 0);
        tot_angle += angle_even;
        x2 = cos(tot_angle)*len + x1;
        y2 = y1 - sin(tot_angle)*len;
        line(x1,y1, x2, y2);
        x1 = x2;
        y1 = y2;
      }
    }
  }
}
