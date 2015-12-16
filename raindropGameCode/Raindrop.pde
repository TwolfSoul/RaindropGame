class Raindrop {
  PVector loc;
  PVector vel;
  int diam;
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

  boolean isInContactWith(PVector killer) {
    if (loc.dist(killer) < diam/2) {
      return true;
    } else {
      return false;
    }
  }
  
  void reset(){
    loc.set(random(width), random(-1000, 0));
}
}