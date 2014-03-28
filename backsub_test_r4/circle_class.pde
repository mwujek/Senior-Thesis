// A circle!
class Circle {
  //  Instead of any of the usual variables, we will store a reference to a Box2D Body
  Body body;      

  float w, h, r, filling;

  Circle(float x, float y) {
    w = 16;
    h = 16;
    r = random(5, 30);
    filling = random(150, 255);
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
    fd.density = 0.01;
    fd.friction = 0.3;
    fd.restitution = 0.75;

    // Attach Fixture to Body               
    body.createFixture(fd);
  }

  void decay() {
      r++;
      
  }
  void display() {
    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(0, filling, filling);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0, 0, r, r);
    popMatrix();
  }


}

