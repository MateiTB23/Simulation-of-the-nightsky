abstract class SpaceEntity {
  protected PVector loc; // Position of the space entity (vector)
  protected PVector speed; // Speed of the space entity (vector)
  protected float lifespan; // Lifespan of the space entity
  protected float lifespanChange; // Change in the lifespan of the space entity
  protected color myColor; // Color of the space entity
  protected float starColorTmp; // Temporary variable for color variation of the space entity
  protected int diameterStar; // Diameter of the space entity
  protected int radiusStar; // Radius of the space entity

  protected SpaceEntity() {
    // Empty constructor
  }

  protected void moveStar() {
    // Moves the space entity by updating its position based on its speed
    loc.x = loc.x + speed.x;
    loc.y = loc.y + speed.y;
  }

  protected boolean isDead() {
    // Checks if the space entity is dead (lifespan is less than or equal to 0)
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }

  protected void update(int hpDamage) {
    // Updates the lifespan of the space entity based on damage
    lifespanChange = hpDamage;
    lifespan = lifespan - lifespanChange;
  }

  abstract void draw();
}
