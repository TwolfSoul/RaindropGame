class catCher {
  int diam;
  color c;
  PVector loc;

  catCher(float x, float y)
  {
    diam = 100;  
    loc = new PVector (x, y);
  }

  void display() {
    noFill();
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }


  void update() {
    loc.set(mouseX, mouseY);
  }
}