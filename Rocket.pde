class Rocket extends SpaceEntity {
  protected float rocketParams; // a protected float for the rockets parameters, protected means that it can only be acessed by classes under it
  private PShape rocketShape; //declaring a PShape object called rocketShape

  public Rocket() {
    loc = new PVector(random(100, width), (height));//defining the location of the rocket object
     speed = new PVector(random(-0.25, 0.25),random(-4, -9));// defining the speed of the rocket object
    lifespan = random(800, 1000); // giving the rocket a lifespan
    rocketParams = random(70, 140); // initialising rocketParams, and giving it a size
    rocketShape = loadShape("rocketsimplepls.svg");//Loading the PShape
  }

  private void drawSpaceShip() {
    shapeMode(CENTER);//The shape is drawn from the center
    shape(rocketShape, loc.x, loc.y, rocketParams, rocketParams); //drawing the rocket
  }
  
  public void draw() {
    drawSpaceShip();//function that draws the rocket
  }
}
