// Declaration of ArrayLists to store instances of different entities
ArrayList<BlinkingStar> blinkingStars = new ArrayList<BlinkingStar>();
ArrayList<ShootingStar> shootingStars = new ArrayList<ShootingStar>();
ArrayList<Rocket> rockets = new ArrayList<Rocket>();
ArrayList<Ufo> ufos = new ArrayList<Ufo>();
Moon moon = null; // The moon object

// Variables for customization
int maxStars = 100; // Maximum number of blinking stars
int DarkBgNight = color(11, 16, 38); // Background color
float colorTMP;

// Timing variables for each entity
int blinkingStarsTimeMs = -1;
int shootinStarsTimeMs = -1;
int moonTimeMs = -1;
int rocketsTimeMs = -1;
int ufosTimeMs = -1;

void setup() {
  size(1080, 720); // Set the canvas size
  // Initialize timing variables
  shootinStarsTimeMs = millis();
  blinkingStarsTimeMs = millis();
  rocketsTimeMs = millis();
  ufosTimeMs = millis();
  moonTimeMs = millis();
  moon = new Moon(); // Create a Moon object
}

void draw() {
  background(DarkBgNight); // Set the background color

  // Call functions to draw different entities
  drawBlinkingStars();
  drawShootingStars();
  drawMoon();
  drawRockets();
  drawUfos();
}

// Function to draw the blinking stars
void drawBlinkingStars() {
  int nowTimeInMilliseconds = millis(); // Get the current time

  // Check if it's time to add a new BlinkingStar
  if (blinkingStarsTimeMs != -1 && nowTimeInMilliseconds > (blinkingStarsTimeMs + random(125, 250))) {
    blinkingStars.add(new BlinkingStar()); // Add a new blinking star
    blinkingStarsTimeMs = nowTimeInMilliseconds; // Update the timing variable
  }

  // Update, draw, and remove blinking stars as necessary
  for (int index = blinkingStars.size()-1; index >= 0; index--) {
    BlinkingStar star = blinkingStars.get(index);
    star.update(int(random(2, 4))); // Update the blinking star
    star.draw(); // Draw the blinking star
    if (star.isDead()) {
      blinkingStars.remove(index); // Remove the blinking star if it's dead
    }
    if (blinkingStars.size() > maxStars) {
      // Update blinking stars with a faster update rate to give them more hpdamage, and kill them faster, works more smoothly then just removing from arraylist
      for (int g = maxStars; g < blinkingStars.size(); g++) {
        blinkingStars.get(g).update(40);
      }
    }
  }
}

// Function to draw the moon
void drawMoon() {
  int nowTimeInMilliseconds = millis();

  // Animate the moon
  if (moonTimeMs != -1 && nowTimeInMilliseconds > (moonTimeMs + 100)) {
    moon.update(); // Update the moon's position
    moonTimeMs = nowTimeInMilliseconds; // Update the timing variable
  }
  moon.draw(); // Draw the moon
}

// Function to draw the shooting stars
void drawShootingStars() {
  int nowTimeInMilliseconds = millis();

  // Check if it's time to add a new ShootingStar
  if (shootinStarsTimeMs != -1 && nowTimeInMilliseconds > (shootinStarsTimeMs + random(2000, 6000))) {
    shootingStars.add(new ShootingStar()); // Add a new shooting star
    //reset startTimeInMilliseconds
    shootinStarsTimeMs = nowTimeInMilliseconds;
  }

  // update, draw and check if ShootingStar needs to be removed
  for (int index = shootingStars.size()-1; index >= 0; index--) {
    ShootingStar starS = shootingStars.get(index);
    starS.draw();
    starS.update(int(random(3, 6)));
    starS.moveStar();
    if (starS.isDead()) {
      shootingStars.remove(index);
    }
  }  
}

void drawRockets() {
  
  // check if the time is right to add a new Rocket
  int nowTimeInMilliseconds = millis();
  if (rocketsTimeMs != -1 && nowTimeInMilliseconds > (rocketsTimeMs + random(8000, 16000))) {
    rockets.add(new Rocket());
    //reset rocketsTimeMs
    rocketsTimeMs = nowTimeInMilliseconds;
  }

  // update, draw and check if Rocket needs to be removed
  for (int index = rockets.size()-1; index >= 0; index--) {
    Rocket rocket = rockets.get(index);
    rocket.moveStar();
    rocket.update(int(random(3, 6)));
    rocket.draw();
    if (rocket.isDead()) {
      rockets.remove(index);
    }
  }  
}

void drawUfos() {
  
  // check if the time is right to add a new Ufo
  int nowTimeInMilliseconds = millis();
  if (ufosTimeMs != -1 && nowTimeInMilliseconds > (ufosTimeMs + random(12000, 20000))) {
    ufos.add(new Ufo(random(1.2, 1.8)));
    //reset ufosTimeMs
    ufosTimeMs = nowTimeInMilliseconds;
  }

  // update, draw and check if Ufo needs to be removed
  for (int index = ufos.size()-1; index >= 0; index--) {
    Ufo ufo = ufos.get(index);
    ufo.update(int(random(2, 4)));    
    ufo.draw();
    if (ufo.isDead()) {
      ufos.remove(index);
    }
  }
}
