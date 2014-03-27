import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A list for all of the circles
ArrayList<Circle> circles;
Surface surface;
Box2DProcessing box2d;  






PImage bg;
Capture video;
OpenCV opencv;

//No need to run all the OpenCV stuff at full res;
//that slows things down a lot.
int scaleFactor = 10;



void setup() {
  size(800, 680);

  //New PImage to store the background image to compare against
  bg = new PImage(width/scaleFactor, height/scaleFactor);

  //New Capture object to get video from the webcam
  video = new Capture(this, width/scaleFactor, height/scaleFactor);
  video.start();

  //New OpenCV object to calc difference between the two, return contours, etc.
  opencv = new OpenCV(this, video, false);  //false here means use grayscale only

  // Initialize and create the Box2D world
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
  box2d.setGravity(0, -20);

  // Create ArrayLists
  circles = new ArrayList<Circle>();
  surface = new Surface();
}

void draw() {

  //Update OpenCV object with latest from camera
  opencv.loadImage(video);

  //Whenever you press a ssmm, we take a snapshot and save it as our
  //new background image to compare against.
  if (keyPressed) {
    bg = opencv.getSnapshot();
  }


  //Calc the difference between the bg image and the OpenCV image
  //and set the OpenCV image to that difference.
  opencv.diff(bg);

  //Perform various image adjustments to brighten just the foreground (subject)
  //The items below may require a lot of tweaking to work best with your lighting setup
  opencv.dilate();
  //opencv.erode();
  //opencv.threshold(50);  //Pixels below x threshold are made black
  //opencv.brightness(200);
  opencv.contrast(2.0);  //1.0+ increases contrast
  opencv.inRange(75, 255);  //Pixels within this range are made white, others made black

  //Finally, draw the diff image to the window, so we can make sure it looks right
  pushMatrix(); //used to keep scale from interfering with other sketch elements

  scale(scaleFactor);
  //image(opencv.getSnapshot(), 0, 0);
  

  //Prepare to draw contours
  strokeWeight(0.1);
   background(0);

  // contours and then draw them to screen
  for (Contour contour : opencv.findContours(false, true)) {  //Contours will be sorted by area, largest first

    //Contours are red
    noStroke();
    //stroke(255, 0, 0);

    noFill();

    //Rectangles (bounding boxes) are blue
    //stroke(0, 0, 255);
    //Rectangle rect = contour.getBoundingBox();
    //rect(rect.x, rect.y, rect.width, rect.height);

    //Get the individual points from the contour

    fill(0, 255, 0);
    noStroke();
    beginShape();
    for (PVector p : contour.getPolygonApproximation().getPoints()) {
      vertex(p.x, p.y);
    }
    endShape();
  } //end loop
  popMatrix();
 
   ellipse(mouseX,mouseY,55,55);
  //Begin BOX2d
  box2d.step();    

  surface.display();

  // When the mouse is clicked, add a new Circle object
  if (frameCount % 10 ==0) {
    Circle p = new Circle(random((width/2)-100, (width/2)+100), random((height/2)-100, (height/2)+100));
    circles.add(p);
  }

  // Display all the circles
  for (Circle b: circles) {
    b.display();
  }
 
  //end BOX2d
}



//Needed for the camera image to update
void captureEvent(Capture c) {
  c.read();
}

