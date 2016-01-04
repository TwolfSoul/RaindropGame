class catCher {
  int diam;
  color c;
  PVector loc;

  catCher(float x, float y)
  {
    diam = 150;  
    //c = color(0);
    loc = new PVector (x, y);
  }

  void display() {
    noFill();
    stroke(0);
    ellipse(loc.x, loc.y, diam, diam);
  }


  void update() {
    loc.set(mouseX, mouseY);
  }
}