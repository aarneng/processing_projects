ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  background(0);
  size(900, 900);
  particles.add(new Particle(width/2, height/2, width/2, height/2));
  particles.get(0).moving = false;
  //frameRate(30);
}

void draw() {
  background(0);
  int notMoving = 1900;
  for (Particle p : particles ) {
    p.move(); p.show();
    if (!p.moving) {notMoving++;}
  }
  if (notMoving > 2000) {shakeAndExplode();}
  else {
    particles.add(new Particle(random(width), random(height), width/2, height/2));
    particles.get(0).r = sqrt(notMoving);
  }
}

float howViolent = 20;
float size;
void shakeAndExplode() {
  for (Particle p : particles ) {
    p.move(); p.show();
  }
  size = max(size, sqrt(particles.size()));
  for (int i = 1; i < particles.size(); i++) {
    if (!particles.get(i).moving) {particles.remove(i);}
  }
  float temp = pow(howViolent, 1/4);
  particles.get(0).cx = width/2+int(random(-temp, temp));
  particles.get(0).cy = height/2+int(random(-temp, temp));
  howViolent ++;
}
