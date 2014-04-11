// A circle!
class Circle {
  //  Instead of any of the usual variables, we will store a reference to a Box2D Body
  Body body;  
  Fixture fixture;


  float w, h, r, filling, opacity;

  Circle(float x, float y, float radius, float radiusDifference, float restitutionValue, float red, float green, float blue, float margin) {
    opacity=255;
    w = 16;
    h = 16;
    r = random(radius, radius+radiusDifference);
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
  //  void update(){
  //    //Destroy the old fixture; we'll replace it in a sec
  //        body.destroyFixture(fixture);
  //        body.createFixture(p); //density after comma
  //
  //  }
  void display() {
    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(red, green, blue, opacity); //blue
    opacity-=0.8;
    
    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    popMatrix();
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
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

