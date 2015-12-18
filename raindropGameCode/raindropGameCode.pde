int fall = 5000;
PVector mouse;   //declare a P
Raindrop[]r = new Raindrop[fall];
catCher k;
//ArrayList<Raindrop> raindrop = new ArrayList<Raindrop>();

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test
//initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
//Initialize r. The parameters used are the initial x and y positions

void setup() {
  size(1200, 800);
  mouse = new PVector();
  for (int i = 0; i < fall; i++)
  {      
    r[i] = new Raindrop(random(width), random(-1000, 0));
  }
  k = new catCher(mouseX, mouseY);
}

void draw() {
  mouse.set(mouseX, mouseY);
  k.update();
  background(255);
  for (int i = 0; i < fall; i++)
  {
    r[i].fall();
    r[i].display();
    if (r[i].isInContactWith(k)) {
      r[i].reset();
    }
    if (r[i].loc.y > height + r[i].diam/2) {
      r[i].reset();
    }
  }
  k.display();
  
}

//make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
//display the raindrop
//if it is, reset the raindrop
//check to see if the raindrop is in contact with the point represented by the PVector called mouse
//check to see if the raindrop goes below the bottom of the screen
//if it does, reset the raindrop