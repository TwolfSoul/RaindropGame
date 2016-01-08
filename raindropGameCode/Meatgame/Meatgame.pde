PVector mouse;
catCher k;
boolean active;
ArrayList<Raindrop> raindrop = new ArrayList<Raindrop>(); //declare and initialize ArrayList Raindrop (Names weren't changed for the sake of convenience...)
int score;
PImage bag;
PImage bag2;
boolean timeStart = false;
float time;
PImage titleTiger;
PImage wood1;
PImage snarl;
boolean loser = false;
int screen = 0; // switches between codes for each screen when value is changed by mousepressed function
PImage safe;

void setup() {
  size(1200, 800);
  mouse = new PVector();
  raindrop.add(new Raindrop(random(200, 500), random(-1000, 0))); //adds a new raindrop to the Raindrop ArrayList
  k = new catCher(mouseX, mouseY); 
  score = 0;
  bag = loadImage("bag.jpg");
  bag2 = loadImage("bag2.jpg");
  time = 60;
  titleTiger = loadImage("ttiger.jpg");
  wood1 = loadImage("wood1.jpg");
  snarl = loadImage("snarl.jpg");
  safe = loadImage("safe.jpg");
}

void draw() {
  // Screen 0 displays the start screen
  if (screen == 0) {
    background(0);
    image(titleTiger, 80, 0);
    fill(random(255), random(95), 0);
    textSize(100);
    text("Feed", 10, 100);
    text("The", 1000, 100);
    text("TIGER", 530, 620);
    fill(255, 0, 0);
    textSize(40);
    text("Catch 1000 scraps of meat in the paper bag...", 185, 660);
    text("Drag slowly or they'll fall out.", 300, 700);
    text("Shake the meat out of the bag into the cage.", 190, 735);
    text("Don't make him wait too long.", 290, 770);
    fill(255, 103, 0);
    textSize(20);
    text("Click to Pause", 520, 790);
    textSize(100);
  } else if (screen == 1) {
    
// Screen 1 is the game screen
    background(wood1);
    mouse.set(mouseX, mouseY);
    k.update();                // updates object k's location to mouse's location
    if (timeStart == true) {
      time = time - 0.020;
    }
    if (time < 20.000 && score < 1000) {
      fill(90, 0, 0);
      textSize(50);
      text("*Growl*", 800, 550);
    }
    if (time < 10.000 && score < 1000) {
      fill(90, 0, 0);
      textSize(80);
      text("*ROAR*", 600, 300);
    }

    textSize(40);
    fill(255, 0, 0);
    text(time, 0, 250);
    fill(88, 64, 27);
    textSize(50);
    text(score, 1000, 50);
    image(bag, mouseX - 50, mouseY - 60);
    if (mouseX > 800) {
      image(bag2, mouseX - 50, mouseY - 60);
    }
    raindrop.add(new Raindrop(random(200, 500), random(-1000, 0))); //adds a new raindrop to the Raindrop ArrayList
    
    for (int i = raindrop.size()-1; i >= 0; i--)                    
    {
      Raindrop r = raindrop.get(i); // Gets raindrop at index 0/location i from ArrayList and stores it as Raindrop r
      r.fall();                     // makes r "fall" 
      r.display();                  // displays r
      if (r.isInContactWith(k)) {  // when Raindrop r is in contact (if the distance between the centers is less than k's radius plus r's radius) with k (object from the catCher class)
        active = true;             // boolean that when true sets r's location at the mouse aka in the bag
        if (active = true) {
          r.loc.set(mouseX, mouseY);
        }
      }
      if (r.loc.y > height + r.diam/2) {  //if r falls past the bottom of the screen, it is removed from the Arraylist
        raindrop.remove(i);
      }
      if (r.loc.x > 900 && r.loc.y > height) // if r enters the "cage" represented by rectangles at the bottom right of the game screen, 1 is added to the score until it falls below the screen (to make obtaining a score of 1000 easier)
      {
        score = score + 1;
      }
    }
    k.display();  // displaying object k from the class catCher
    stroke(64, 64, 64);
    fill(96, 96, 96);
    rect(800, 600, 400, 20);
    rect(850, 620, 20, 200);
    rect(900, 620, 20, 200);
    rect(950, 620, 20, 200);
    rect(1000, 620, 20, 200);
    rect(1050, 620, 20, 200);
    rect(1100, 620, 20, 200);
    rect(1150, 620, 20, 200);
    if (time < 00.000 && score < 1000) // if the time reaches 0 and the score is still below 1000, screen 2 (the losing screen) is displayed
    {
      screen = 2; 
    }
    
    if (time < 00.00 && score >= 1000) {  // if the time reaches 0 and the score is or is above 1000, screen 3(the winning screen) is displayed
      screen = 3;
    }
    
  } else if (screen == 2) {
    image(snarl, 0, 0);
    fill(255, 0, 0);
    textSize(100);
    text("YOU ARE DEAD", 200, 200);
  } else if (screen == 3) {
    image(safe, 0, 0);
    fill(88, 64, 27);
    textSize(50);
    text("You Are Safe For the Time Being.", 200, 750);
  } else if (screen == 4) {
   //pause screen
  }
}


void mousePressed() // it is mousePressed that changes the value of screen, skipping to the block of codes of each screen
{
  if (screen == 0) {
    screen = 1;
    timeStart = !timeStart; // boolean that starts the timer
  } else if (screen == 1) {
    screen = 4;
  } else if (screen == 4) {
    screen = 1;
  } else if (screen == 3 || screen == 2) {
    screen = 0;
    time = 60.000;
    score = 0;
    timeStart = !timeStart;
  }
}