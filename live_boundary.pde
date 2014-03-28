class LiveSurface{
    ArrayList<Vec2> liveSurface;
 //  Instead of any of the usual variables, this will store a reference to a Box2D Body


    LiveSurface() {
        liveSurface = new ArrayList<Vec2>(); //how do i return values from a for loop
        //openCV code below
        for (Contour contour : opencv.findContours(false, true)) {  //Contours will be sorted by area, largest first

        //Get the individual points from the contour
            for (PVector p : contour.getPolygonApproximation().getPoints()) {
                //liveSurface = new ArrayList<Vec2>(); //how do i return values from a for loop
                for (int i=0; i<100; i++){
                    liveSurface.add(new Vec2(p.x, p.x));
                }
                //vertex(p.x, p.y); //this is for drawing a shape...needs to be changed to an array
            }
  } //end openCV loop

  //OLD VERTICES FOR BOX2D CHAINSHAPE...NOW USING FOR LOOP (ABOVE)
  //liveSurface = new ArrayList<Vec2>();
  //liveSurface.add(new Vec2(0, height));
  //liveSurface.add(new Vec2(width,height-100));


  ChainShape chain = new ChainShape();

  // Make an array of Vec2 (from openCV) for the ChainShape.
  Vec2[] contourVertices = new Vec2[liveSurface.size()];


  for (int i = 0; i < contourVertices.length; i++) {
      // Convert each vertex to Box2D World coordinates.
      contourVertices[i] = box2d.coordPixelsToWorld(liveSurface.get(i));
  }

    // Create the ChainShape with array of Vec2.
  chain.createChain(contourVertices, contourVertices.length);

   //Attach the Shape to the Body.
  BodyDef bd = new BodyDef();
  Body body = box2d.world.createBody(bd);
  body.createFixture(chain, 1);
    //[end]
}


void display() {
    strokeWeight(5); //add strokeweight
    stroke(#ffcc00); //gold stroke
    noFill();

    // Draw the ChainShape as a series of vertices.
    beginShape();
    for (Vec2 v: liveSurface) {
      vertex(v.x,v.y);
  }

  endShape();
}

}

