class catCher {
  int diam;
  color c;
  PVector loc;

  catCher(float x, float y)
  {
    diam = 100;  
    c = color(164,129,76);
    loc = new PVector (x, y);
  }

  void display() {
    fill(c);
    stroke(97,69,27);
    ellipse(loc.x, loc.y, diam, diam);
  }


  void update() {
    loc.set(mouseX, mouseY);
  }
}