class LiveSurface{
 
 //  Instead of any of the usual variables, this will store a reference to a Box2D Body
  Body body;      

  float x, y;

  LiveSurface(float _x, float _y) {
    x = _x;
    y = _y;

    
    // Build Body
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);


    // Define a circle
    CircleShape cs = new CircleShape();
   
    cs.m_radius = box2d.scalarPixelsToWorld(2);
    
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 0.1;
    fd.friction = 0.3;
    fd.restitution = 0.75;

    // Attach Fixture to Body               
    body.createFixture(fd);
  }
  
  
  void display() {
    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    ellipseMode(CENTER);
    stroke(255,0,0);
    line(0,0,100,100);
    popMatrix();
  }

}

