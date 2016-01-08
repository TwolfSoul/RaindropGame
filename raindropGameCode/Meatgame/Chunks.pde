class Raindrop {
  PVector loc, vel, accel;
  float diam;
  float hue, sat, bright, alpha;
  color c;

  Raindrop(float x, float y)
  {
    diam = random(30);  
    loc = new PVector (x, y);
    vel = new PVector (0, random(6, 8 ));
    c = color(150, 0, 0);
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

  boolean isInContactWith(catCher killer) { //function to check if the raindrop is in contact with the point represented by the PVector called killer
    if (loc.dist(killer.loc) < diam/2+killer.diam/2) {
      return true;
    } else {
      return false;
    }
  }
  
  void reset(){
    loc.set(random(200,500), random(-1000, 0));
}
}