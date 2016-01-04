class Raindrop {
  PVector loc, vel, accel;
  int diam;
  float hue, sat, bright, alpha;
  color c;

  Raindrop(float x, float y)
  {
    diam = 20;  
    loc = new PVector (x, y);
    vel = new PVector (0, random(8, 10));
    c = color(255, 0, 0);
  }

  void display() {
    fill(c);
    stroke(90,0,0);
    strokeWeight(5);
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
    loc.set(random(600), random(-1000, 0));
}
}