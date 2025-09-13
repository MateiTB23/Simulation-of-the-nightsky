final class BlinkingStar extends SpaceEntity {
  private PVector size; // Size of the blinking star
  private float sizeMin;
  private float sizeMax;
  private static final float min = 1;
  private static final float max = 6;
  
  public BlinkingStar() {
    loc = new PVector(random(0, width), random(0, height)); // Randomly sets the position of the blinking star within the canvas
    radiusStar = diameterStar / 2; // Calculates the radius of the blinking star
    starColorTmp = random(225, 255); // Randomly determines the temporary color of the blinking star
    myColor = color(starColorTmp); // Sets the color of the blinking star
    speed = new PVector(random(0.01, 0.1), random(0.01, 0.1)); // Sets the speed of the blinking star
    lifespan = random(400, 1000); // Sets the lifespan of the blinking star
    float sizeMid = random(min, max);
    sizeMin = random(min, sizeMid);
    sizeMax = random(sizeMid, max);
  }

  private void displayStar() {
    float r = random(sizeMin, sizeMax);
    size = new PVector(r, r); // Randomly sets the size of the blinking star, creating a blinking effect
    strokeWeight(random(0.2, 0.5)); // Sets the stroke weight of the blinking star
    stroke(30, 10, 230); // Sets the stroke color of the blinking star
    fill(myColor, lifespan); // Sets the fill color of the blinking star based on its lifespan
    ellipse(loc.x, loc.y, size.x, size.y); // Draws the blinking star as an ellipse
  }
  
  public void draw() {
    displayStar();
  }
}
