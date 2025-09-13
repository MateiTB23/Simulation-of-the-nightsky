final class Ufo extends Rocket {
  private PVector loc2; // Second location of the UFO
  private PVector Instance1; // First instance vector
  private PVector Instance2; // Second instance vector
  private PVector chosenInstance; // The chosen instance vector
  private PVector speed2; // Second speed vector
  private float chosenSpeed; // The chosen speed value
  private float ufoParams; // UFO parameters
  private PShape ufoShape; // UFO shape
  private float SizeAdjust; // Size adjustment factor

  public Ufo(float Coefficient) {
    super();
    SizeAdjust = random(1.2, 1.8); // Random size adjustment factor for the UFO
    speed = new PVector(random(2, 5), random(-0.1, 0.1)); // First speed vector
    speed2 = new PVector(random(-2, -5), random(-0.1, 0.1)); // Second speed vector
    ufoParams = rocketParams / Coefficient; // UFO parameters based on the coefficient
    loc = new PVector(0, random(0 + ufoParams, height - ufoParams)); // Starting location for the ufo if it comes from the left side of the canvas
    loc2 = new PVector(width, random(0 + ufoParams, height - ufoParams)); // Starting location for the ufo if it comes from the right side
    float x = loc.x;
    float y = loc.y;
    float x2 = loc2.x;
    float y2 = loc2.y;
    Instance1 = new PVector(x, y); // First instance vector of coordinates, where to ufo comes from the left
    Instance2 = new PVector(x2, y2); // Second instance vector
    float rand = random(0, 2); // Random value between 0 and 2
    if (rand < 1) {
      chosenInstance = Instance1; // Set the chosen instance vector to the first instance
      chosenSpeed = speed.x; // Set the chosen speed to the first speed value, to make it go from left to right
    } else {
      chosenInstance = Instance2; // Set the chosen instance vector to the second instance
      chosenSpeed = speed2.x; // Set the chosen speed to the second speed value to make it go from right to left
    }
    ufoShape = loadShape("ufo.svg"); // Load the UFO shape from an SVG file
  }

  protected void moveStar() {
    chosenInstance.x = chosenInstance.x + chosenSpeed; // Update the x-position of the chosen instance
    chosenInstance.y = chosenInstance.y + speed.y; // Update the y-position of the chosen instance
  }

  private void drawSpaceShip() {
    shapeMode(CENTER);
    shape(ufoShape, chosenInstance.x, chosenInstance.y, ufoParams, ufoParams); // Draw the UFO shape at the chosen instance position, with the predefined ufoParams
  }

  void draw() {
    drawSpaceShip(); // Draw the UFO
    moveStar(); // Move the UFO
  }
}
