PVector mouse;
catCher k;
boolean active;
ArrayList<Raindrop> raindrop = new ArrayList<Raindrop>();


void setup() {
  size(1200, 800);
  mouse = new PVector();
  raindrop.add(new Raindrop(random(600), random(-1000, 0)));
  k = new catCher(mouseX, mouseY);
}

void draw() {
  println(raindrop.size());
  mouse.set(mouseX, mouseY);
  k.update();
  background(255);
  raindrop.add(new Raindrop(random(600), random(-1000, 0)));
  for (int i = raindrop.size()-1; i >= 0; i--)
  {
    Raindrop r = raindrop.get(i);
    r.fall();
    r.display();
    if (r.isInContactWith(k)) {
      active = true;
      if (active = true){
        r.loc.set(mouseX,mouseY);
      }
    }
    if (r.loc.y > height + r.diam/2) {
      raindrop.remove(i);
    }
  }
  k.display();
}