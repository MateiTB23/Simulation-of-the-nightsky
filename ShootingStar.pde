final class ShootingStar extends SpaceEntity {
  float starSizeFall; // Rate at which the size of the shooting star decreases
  color strokeColor; // Color of the stroke
  ArrayList<PVector> trailPoints; // ArrayList of trail points for the space entity's trail
  float randomTrailSizeFactor; // Factor to add variation in trail size

  public ShootingStar() {
    loc = new PVector(random(100, width), 0); // Randomly sets the initial position of the shooting star at the top of the canvas
    speed = new PVector(random(-5, 5), random(4, 9)); // Sets the speed of the shooting star
    lifespan = random(400, 550); // Sets the lifespan of the shooting star
    starSizeFall = random(3, 5); // Sets the rate at which the size of the shooting star decreases

    int yellow = (int) random(150, 255); // Randomly determines the yellow component of the color
    myColor = color(yellow, yellow, 0); // Sets the color of the shooting star
    strokeColor = color(255, 255, 0); // Sets the stroke color of the shooting star
    trailPoints = new ArrayList<PVector>(); // Initializes the trail points as an empty list
    randomTrailSizeFactor = random(0.3, 3); // Randomly determines the factor by which the size of the trail points can vary
  }

  private void drawStar(float x, float y, float s, float l) {
    stroke(myColor, l); // Sets the stroke color and alpha of the shooting star
    strokeWeight(2); // Sets the stroke weight of the shooting star
    fill(myColor, l); // Sets the fill color and alpha of the shooting star

    beginShape(); //Drawing the star
    vertex(x, y - 50 / s);
    vertex(x + 14 / s, y - 20 / s);
    vertex(x + 47 / s, y - 15 / s);
    vertex(x + 23 / s, y + 7 / s);
    vertex(x + 29 / s, y + 40 / s);
    vertex(x, y + 25 / s);
    vertex(x - 29 / s, y + 40 / s);
    vertex(x - 23 / s, y + 7 / s);
    vertex(x - 47 / s, y - 15 / s);
    vertex(x - 14 / s, y - 20 / s);
    endShape(CLOSE);
  }

  private void drawTrail() {
    // Draw the trail points as a series of stars with decreasing alpha and size
    for (int i = 0; i < trailPoints.size() - 1; i++) {
      float alpha = map(i, 0, trailPoints.size() - 1, 0, 70); // Maps the index to an alpha value for the trail points
      float size = map(i, 0, trailPoints.size() - 1, starSizeFall / randomTrailSizeFactor, starSizeFall); // Maps the index to a size value for the trail points
      drawStar(trailPoints.get(i).x, trailPoints.get(i).y, size / random(0.75, 1), alpha); // Draws a star at each trail point with adjusted size and alpha
    }
  }
  
  private void updateTrail() {
    // Adds the current position to the trail points
    trailPoints.add(loc.copy());

    // Removes the oldest position if the trail is too long
    if (trailPoints.size() > 20) {
      trailPoints.remove(0);
    }
  }

  public void draw() {
    updateTrail(); // Updates the trail points of the shooting star
    drawTrail(); // Draws the trail of the shooting star
    drawStar(loc.x, loc.y, starSizeFall, lifespan); // Draws the shooting star itself
  }
}
