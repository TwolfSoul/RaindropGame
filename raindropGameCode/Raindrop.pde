class Raindrop {
  PVector mouse;
  PVector loc;
  PVector grav;
  PVector accel;
  int diam;
  color c;

  Raindrop()
  {
    diam = 15;
    mouse = new PVector();  
    loc = new PVector (random(width), -100);
    grav = new PVector (2, 0);
    accel = new PVector (0.01,0);
    c = color(153, 255, 255);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    loc.add(grav);
    grav.add(accel);
  }
  
 void isInContactWith() {
   