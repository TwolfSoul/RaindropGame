class Raindrop {
  int fall = 300;
  PVector[]mouse = new PVector[fall];
  int diam = 15;
  color c;
  
  Raindrop()
  {
    for (int i = 0; i < fall; i++)
  {
    