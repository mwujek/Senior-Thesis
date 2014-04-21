class LiveSurface {



  //Variables
  ArrayList<Vec2> points;
  //  Instead of any of the usual variables, this will store a reference to a Box2D Body
  Body body;
  Fixture fixture;



  //Constructor
  LiveSurface() {

    //Initially, make a default surface (line) --> change this to a circle!!
    points = new ArrayList<Vec2>(); 
    points.add(new Vec2(0, height));
    points.add(new Vec2(width, height-100));

    ChainShape chain = new ChainShape();

    // Make an array of Vec2 (from openCV) for the ChainShape.
    Vec2[] contourVertices = new Vec2[points.size()];

    for (int i = 0; i < contourVertices.length; i++) {
      // Convert each vertex to Box2D World coordinates.
      contourVertices[i] = box2d.coordPixelsToWorld(points.get(i));
    }

    // Create the ChainShape with array of Vec2.
    chain.createChain(contourVertices, contourVertices.length);

    //Attach the Shape to the Body.
    BodyDef bd = new BodyDef();
    body = box2d.world.createBody(bd);
    fixture = body.createFixture(chain, 1);
    //[end]
  }



  //Additional methods 

  void update() {
    opencv.setROI(0, 0, width/2, height);

    //Only update if at least one contour has been found
    if (opencv.findContours().size() > 1) {

      //Destroy the old fixture; we'll replace it in a sec
      body.destroyFixture(fixture);

      //Make a new ArrayList of points
      points = new ArrayList<Vec2>();

      //openCV code below

      //>>>>instead of for looping, just grab the first arraylist item

      Contour contour = opencv.findContours(false, true).get(0);  //Contours will be sorted by area, largest first
      //println(contour);

      //Get the individual points from the contour
      Contour polygon = contour.getPolygonApproximation();
      
      for (PVector p : polygon.getPoints()) {
        points.add(new Vec2(p.x * 10, p.y * 10)); //*10 bc of scaleValue (program=faster)
      }
      
      //Finally, add on the first point to close the shape
      PVector firstPoint = polygon.getPoints().get(0);
      points.add(new Vec2(firstPoint.x * 10, firstPoint.y * 10));


      ChainShape chain = new ChainShape();

      // Make an array of Vec2 (from openCV) for the ChainShape.
      Vec2[] contourVertices = new Vec2[points.size()];

      for (int i = 0; i < contourVertices.length; i++) {
        // Convert each vertex to Box2D World coordinates.
        contourVertices[i] = box2d.coordPixelsToWorld(points.get(i));
      }

      // Create the ChainShape with array of Vec2.
      chain.createChain(contourVertices, contourVertices.length);

      //Attach the Shape to the Body.
      fixture = body.createFixture(chain, 500); //density after comma

    }
    //End updating
  }


  void display() {
    strokeWeight(1); //add strokeweight
    fill(0); //gold stroke
    
    noStroke();

    // Draw the ChainShape as a series of vertices.
    beginShape();
    for (Vec2 v: points) {
      vertex(v.x, v.y);
    }

    endShape();
  }
}

