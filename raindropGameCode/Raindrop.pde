class Raindrop {
  PVector loc, vel, accel;
  int diam;
  float hue, sat, bright, alpha;
  color c;

  Raindrop(float x, float y)
  {
    diam = 5;  
    loc = new PVector (x, y);
    vel = new PVector (0, random(8, 10));
    c = color(20, 50, 255);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    loc.add(vel);
  }

  boolean isInContactWith(catCher killer) {
    if (loc.dist(killer.loc) < diam/2+killer.diam/2) {
      return true;
    } else {
      return false;
    }
  }
  
  void reset(){
    loc.set(random(width), random(-1000, 0));
}
}