void setup() {
  size(400, 400, P3D);
  strokeWeight(2);
  float inv_size = 2.3;
  int min = int(min(width, height)/inv_size);
  int max = int((inv_size -1)*min);
  line(min, min, min, max, min, min);
  line(min, min, min, min, max, min);
  line(min, min, min, min, min, max);
  line(max, min, min, max, max, min);
  line(max, min, min, max, min, max);
  line(min, max, min, max, max, min);
  line(min, max, min, min, max, max);
  line(max, max, min, max, max, max);
  line(min, min, max, max, min, max);
  line(min, min, max, min, max, max);
  line(max, min, max, max, max, max);
  line(min, max, max, max, max, max);
  
}
