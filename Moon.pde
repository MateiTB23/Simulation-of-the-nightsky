final class Moon extends SpaceEntity {
  private boolean isWaxing; // Indicates whether the moon is waxing (growing) or waning (shrinking)
  private float litFactor; // Determines the brightness of the moon
  private boolean direction;
  private float step;
  private int points = 30; // Number of points used to draw the moon

  public Moon() {
    isWaxing = (boolean) ((int) random(0, 1) == 1); // Randomly sets the waxing state of the moon
    litFactor = random(0, 1); // Randomly sets the brightness factor of the moon
    step = 0.01;
    direction = true;

    int randSize = (int) random(8, 12); // Randomly determines the size of the moon

    loc = new PVector((int) random(width / randSize, (randSize - 1) * width / randSize), (int) random(height / randSize, (randSize - 1) * height / randSize)); // Randomly sets the position of the moon
    diameterStar = width / randSize; // Sets the diameter of the moon based on the size
    radiusStar = diameterStar / 2; // Calculates the radius of the moon
  }

  private void drawMoon(float cx, float cy, float r, boolean isWaxing, float litFactor, int points) {
    // Drawing the background
    strokeWeight(1);
    stroke(DarkBgNight);
    fill(DarkBgNight + 10);
    circle(cx, cy, 2 * r);

    float dtheta = PI / (points - 1);

    // Drawing the lit part
    noStroke();
    fill(240, 240, 155);

    float angleTop = -PI / 2;
    int dir = isWaxing ? 1 : -1; // Determines the direction of the moon's growth

    beginShape();

    // Drawing the outside arc of the moon
    for (int i = 0; i < points; i++) {
      float theta = angleTop + i * dtheta * dir;
      float x = cx + r * cos(theta);
      float y = cy + r * sin(theta);
      vertex(x, y);
    }

    // Drawing the inside arc of the moon
    float rin = r * (1 - 2 * litFactor);
    for (int i = points - 1; i >= 0; i--) {
      float theta = angleTop + i * dtheta * dir;
      float x = cx + rin * cos(theta);
      float y = cy + r * sin(theta);
      vertex(x, y);
    }

    endShape();
  }
  
  public void update() {
    // The moon does not change its position when update is called, but it changes the lit factor.
    // The lit factor goes between 0 and 1, where 0 means not lit at all and 1 means full lit.
    
    // This function increments the lit with step until 1, then decrements the litFactor value
    // with step until litFactor reaches 0, then it increments it again.
    
    if(direction) {
      litFactor += step;
      if(litFactor > 1) {
        litFactor = 1;
        direction = false;
        isWaxing = !isWaxing;
      }
    } else { 
      litFactor -= step;
      if(litFactor < 0) {
        litFactor = 0;
        direction = true;
        isWaxing = !isWaxing;
      }
    }
  }

  public void draw() {
    stroke(255);
    strokeWeight(1);
    drawMoon(loc.x, loc.y, radiusStar, isWaxing, litFactor, points);
  }
}
