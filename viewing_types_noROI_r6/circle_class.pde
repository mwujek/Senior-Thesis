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
  Circle(float x, float y, float restitutionValue) {
    opacity=255;
    w = 16;
    h = 16;
    //radius =setRadius;
    r = random(30, 60);
    margin =setRadius/2;   


    filling = random(60, 190);
    // Build Body
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);



    // Define a circle
    CircleShape cs = new CircleShape();

    cs.m_radius = box2d.scalarPixelsToWorld(r/2);

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
    if (eiLeftSaturation<0) {
      fill(138, abs((eiLeftSaturation*255)-40), 237, opacity); //blue
    } 
    else {
      fill(160, abs((eiLeftSaturation*255)-40), 205, opacity); //navy
      //fill(12, abs((eiLeftSaturation*255)-40), 237, opacity); //blue
    }
    opacity-=decreaseOpacitySpeed;
    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleEI();//text



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
    if (snLeftSaturation<0) {
      fill(228, abs((snLeftSaturation*255)-40), 234, opacity); //pink
    }
    else {
      //fill(193, abs((snLeftSaturation*255)-40), 180, opacity); //purple
      fill(25, abs((snLeftSaturation*255)-40), 237, opacity); //orange
    }
    opacity-=decreaseOpacitySpeed;


    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleSN();

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

    if (tfLeftSaturation<0) {
            fill(35, abs((tfLeftSaturation*255)-40), 255, opacity); //yellow

    }
    else {
      fill(255, abs((tfLeftSaturation*255)-40), 235, opacity); //red
    }


    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleTF();

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

    if (jpLeftSaturation<0) {
      fill(89, abs((jpLeftSaturation*255)-40), 179, opacity); //green
    }
    else {
      //fill(35, abs((jpLeftSaturation*255)-40), 255, opacity); //yellow
      fill(193, abs((jpLeftSaturation*255)-40), 180, opacity); //purple
    }
    


    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayLeftCircleJP();

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
      if (eiRightSaturation<0) {
      fill(138, abs((eiRightSaturation*255)-40), 237, opacity); //blue
    } 
    else {
      fill(160, abs((eiRightSaturation*255)-40), 205, opacity); //navy
      //fill(12, abs((eiLeftSaturation*255)-40), 237, opacity); //blue
    }
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayRightCircleEI();



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

    if (snRightSaturation<0) {
      fill(228, abs((snRightSaturation*255)-40), 234, opacity); //pink
    }
    else {
      //fill(193, abs((snLeftSaturation*255)-40), 180, opacity); //purple
      fill(25, abs((snRightSaturation*255)-40), 237, opacity); //orange
    }



    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayRightCircleSN();

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




        if (tfRightSaturation<0) {
            fill(35, abs((tfRightSaturation*255)-40), 255, opacity); //yellow

    }
    else {
      fill(255, abs((tfRightSaturation*255)-40), 235, opacity); //red
    }
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayRightCircleTF();

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



        if (jpRightSaturation<0) {
      fill(89, abs((jpRightSaturation*255)-40), 179, opacity); //green
    }
    else {
      //fill(35, abs((jpLeftSaturation*255)-40), 255, opacity); //yellow
      fill(193, abs((jpRightSaturation*255)-40), 180, opacity); //purple
    }
    
    opacity-=decreaseOpacitySpeed;

    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    displayRightCircleJP();

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

