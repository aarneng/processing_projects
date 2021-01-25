// TODO: fix zoom bug

int len = 50000;
int[] seq = new int[len];
int n = 0;
float s;
float e;
int curr;
int prev;
float zoom;

void setup() {
  size(1920, 1080);
  seq[0] = 0;
  noFill();
  frameRate(10);
}

void draw() {
  background(220);
  step();
  showStep();
}

void step() {
  n++;
  if (!contains(seq, n) && seq[n-1] - n > 0) {
    seq[n] = seq[n-1] - n;
  } else {seq[n] = seq[n-1] + n;}
}

void showStep() {
  zoom = (float)width/(max(seq) + 1000);
  translate(0, height*zoom/2);
  scale(zoom);
  print(zoom, "\n");
  boolean up = true;
  for (int i = 1; i < n + 1; i++) {
    if (up) {
      s = 0; e = PI;
    }
    else {
      s = PI; e = 2*PI;
    }
    prev = 10*seq[i-1];
    curr = 10*seq[i];
    stroke(map(i, 0, n, 0, 255), 0, 0);
    arc((prev + curr)/2, height/2, abs(prev - curr), abs(prev - curr), s, e);
    up = !up;
  }
}

boolean contains(int[] arr, int num) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == num) {
      return true;
    }
  }
  return false;
}
