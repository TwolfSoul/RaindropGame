class Raindrop {
  PVector loc;
  PVector vel;
  //PVector accel;
  int diam;
  color c;

  Raindrop(float x, float y)
  {
    diam = 15;  
    loc = new PVector (x, y);
    vel = new PVector (0,random(8,20));
    //accel = new PVector (0.01,0);
    c = color(153, 255, 255);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    loc.add(vel);
    //vel.add(accel);
  }
  
 //void isInContactWith() {
   
 }