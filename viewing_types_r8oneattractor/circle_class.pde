// A circle!
class Circle {
  //  Instead of any of the usual variables, we will store a reference to a Box2D Body
  Body body;  
  Fixture fixture;
  PImage img;

  float w, h, r, filling, opacity;
  float scaled;
  boolean startGrowing;
  float inc = TWO_PI/25.0; //used for smoothing 'easing' on radius growth/shrinking
  float a =0.0;
  Circle(float x, float y, float radius, float radiusDifference, float restitutionValue, float margin) {
    opacity=255;
    w = 16;
    h = 16;
    r = random(radius, radius+10);

    filling = random(60, 190);
    // Build Body
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);



    // Define a circle
    CircleShape cs = new CircleShape();

    cs.m_radius = box2d.scalarPixelsToWorld(r/(2-margin));

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = restitutionValue;

    // Attach Fixture to Body               
    fixture = body.createFixture(fd);
  }


  //LEFT SIDE------------------------------------------------------------------------------------------------
  void displayEILeft() {
    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);     // translate and rotate the rectangle
    noStroke();
    //image(img, 0, 0);
    fill(110, abs(eiLeftSaturation)*255, 200, opacity); //blue
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleEI();
    
    if (r<radius) {
      startGrowing=true;
    } 
    if (r>radius+10) {
      startGrowing=false;
    }
    if (startGrowing) {
      r+=growRate;
    }
    else {

      r-=deflateRate;
    }

    popMatrix();
  }



  //This controls sensing and intution
  void displaySNLeft() {

    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);     // translate and rotate the rectangle
    noStroke();
    //image(img, 0, 0);
    fill(120, abs(snLeftSaturation)*255, 200, opacity); //blue
    opacity--;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleSN();
    if (r<radius) {
      startGrowing=true;
    } 
    if (r>radius+10) {
      startGrowing=false;
    }
    if (startGrowing) {
      r+=growRate;
    }
    else {

      r-=deflateRate;
    }
    popMatrix();
  }


  //This controls thinking and feeling
  void displayTFLeft() {

    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);     // translate and rotate the rectangle
    noStroke();
    //image(img, 0, 0);
    fill(130, abs(tfLeftSaturation)*255, 200, opacity);
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleTF();
    if (r<radius) {
      startGrowing=true;
    } 
    if (r>radius+10) {
      startGrowing=false;
    }
    if (startGrowing) {
      r+=growRate;
    }
    else {

      r-=deflateRate;
    }
    popMatrix();
  }

//This controls Judging and Perception
  void displayJPLeft() {

    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);     // translate and rotate the rectangle
    noStroke();
    //image(img, 0, 0);
    fill(140, abs(jpLeftSaturation)*255, 200, opacity); //blue
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleJP();
    if (r<radius) {
      startGrowing=true;
    } 
    if (r>radius+10) {
      startGrowing=false;
    }
    if (startGrowing) {
      r+=growRate;
    }
    else {

      r-=deflateRate;
    }
    popMatrix();
  }

//RIGHT SIDE------------------------------------------------------------------------------------------------

    void displayEIRight() {
    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);     // translate and rotate the rectangle
    noStroke();
    //image(img, 0, 0);
    fill(200, abs(eiRightSaturation)*255, 200, opacity); //blue
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
        displayLeftCircleEI();

    if (r<radius) {
      startGrowing=true;
    } 
    if (r>radius+10) {
      startGrowing=false;
    }
    if (startGrowing) {
      r+=growRate;
    }
    else {

      r-=deflateRate;
    }

    popMatrix();
  }



  //This controls sensing and intution
  void displaySNRight() {

    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);     // translate and rotate the rectangle
    noStroke();
    //image(img, 0, 0);
    fill(215, abs(snRightSaturation)*255, 200, opacity); //blue
    opacity--;

    ellipseMode(CENTER);
    
    ellipse(0, 0, r, r);
    displayLeftCircleSN();
    if (r<radius) {
      startGrowing=true;
    } 
    if (r>radius+10) {
      startGrowing=false;
    }
    if (startGrowing) {
      r+=growRate;
    }
    else {

      r-=deflateRate;
    }
    popMatrix();
  }


  //This controls thinking and feeling
  void displayTFRight() {

    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);     // translate and rotate the rectangle
    noStroke();
    //image(img, 0, 0);
    fill(230, abs(tfRightSaturation)*255, 200, opacity);
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleTF();
    if (r<radius) {
      startGrowing=true;
    } 
    if (r>radius+10) {
      startGrowing=false;
    }
    if (startGrowing) {
      r+=growRate;
    }
    else {

      r-=deflateRate;
    }
    popMatrix();
  }

//This controls Judging and Perception
  void displayJPRight() {

    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);     // translate and rotate the rectangle
    noStroke();
    //image(img, 0, 0);
    fill(245, abs(jpRightSaturation)*255, 200, opacity); //blue
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleJP();
    if (r<radius) {
      startGrowing=true;
    } 
    if (r>radius+10) {
      startGrowing=false;
    }
    if (startGrowing) {
      r+=growRate;
    }
    else {

      r-=deflateRate;
    }
    popMatrix();
  }


  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }
  void applyForce(Vec2 v) {
    body.applyForce(v, body.getWorldCenter());
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height || opacity<20) {
      killBody();
      return true;
    }
    return false;
  }
}

