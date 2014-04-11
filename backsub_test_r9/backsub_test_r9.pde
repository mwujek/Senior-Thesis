import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import oscP5.*;
import netP5.*;

//TouchOSC variables + import
OscP5 oscP5;
float red = 0.0f;
float green = 0.0f;
float blue = 0.0f;
float creationRate = 0.0f;



// A list for all of the circles
ArrayList<Circle> circles;
ArrayList<Circle> circles2;
ArrayList<Circle> circles3;
ArrayList<Circle> circles4;

ArrayList<Boundary> boundaries;


//Surface surface;
LiveSurface contourBoundaries;

Box2DProcessing box2d;  

PImage bg;
Capture video;
OpenCV opencv;

//No need to run all the OpenCV stuff at full res;
//that slows things down a lot.
int scaleFactor = 10;
float radius = 10f;
float radiusDifference= 20;
float restitutionValue = 0.0f;
float blurValue=1;
float margin= 0.0f;


void setup() {
  size(1920, 1080);
  oscP5 = new OscP5(this, 8000); //new OSC object 


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
  box2d.setGravity(0, -80);


  // Create ArrayLists
  circles = new ArrayList<Circle>();
  circles2 = new ArrayList<Circle>();
  circles3 = new ArrayList<Circle>();
  circles4 = new ArrayList<Circle>();
  
    boundaries = new ArrayList<Boundary>();

   boundaries.add(new Boundary(0,height-5,width*2,10));
  boundaries.add(new Boundary(width-5,height/2,10,height));
  boundaries.add(new Boundary(5,height/2,10,height));

  //surface = new Surface();
  contourBoundaries = new LiveSurface();
  //circles = new ArrayList<LiveSurface>(); //ARRAY OF LIVE SURFACE POINTS (DRAWN EVERY FRAME)
}

void draw() {
  //println("This is the frameRate:"+frameRate);



  //println("This is the blurValue:"+blurValue);
  background(0);

  //LIGHTING TESTING
//  if (keyPressed) {
//    if (key == 'b' || key == 'B') {
//      blurValue-=0.01;
//    }
//
//    if (key == 'a' || key == 'A') {
//      blurValue+=0.01;
//    }
//  }

  //Update OpenCV object with latest from camera
  opencv.loadImage(video);

  //Whenever you press a ssmm, we take a snapshot and save it as our
  //new background image to compare against.
  if (mousePressed) {
    
     
        bg = opencv.getSnapshot();
     
   
  }

  //Calc the difference between the bg image and the OpenCV image
  //and set the OpenCV image to that difference.
  opencv.diff(bg);

  //Perform various image adjustments to brighten just the foreground (subject)
  //The items below may require a lot of tweaking to work best with your lighting setup
  opencv.dilate();

  opencv.blur(8);
  //opencv.erode();
  opencv.brightness(35);
  opencv.contrast(1.9);  //1.0+ increases contrast
  opencv.inRange(120, 255);  //Pixels within this range are made white, others made black





  //Begin BOX2d
  box2d.step();   


  //surface.display();
  //contourBoundaries.display();
  if (keyPressed) {
    if (key ==CODED) {
      if (keyCode == UP) {
        radius+=0.3;
      }
      if (keyCode == DOWN && radius > 1) {
        radius-=0.3;
      }
      if (keyCode == LEFT && restitutionValue > 0) {
        restitutionValue-=0.01;
      }
      if (keyCode == RIGHT && restitutionValue < 1.5) {
        restitutionValue+=0.01;
      }
    }
  }
  // Every 'x amount' of frames, create a new circle object
  if (frameCount % (12-creationRate) ==0) {
    Circle p = new Circle(random(width), -50, radius, radiusDifference, restitutionValue,red,green,blue,margin);
    circles.add(p);
    Circle p2 = new Circle(random(width), -50, radius, radiusDifference, restitutionValue,255,22,0,margin);
    circles2.add(p2);
//    Circle p3 = new Circle(random((width/2-100), (width/2+100)), random((height/2-100), (height/2+100)), radius, radiusDifference, restitutionValue,0,255,100);
//    circles3.add(p3);
//    Circle p4 = new Circle(random((width/2-100), (width/2+100)), random((height/2-100), (height/2+100)), radius, radiusDifference, restitutionValue,0,255,100);
//    circles4.add(p4);
    //p.update();g
  }
  // Display all the circles
  for (Circle b: circles) {
    b.display();
  }
//
  for (Circle b2: circles2) {
    b2.display();
  }
//
//  for (Circle b: circles3) {
//    b.display();
//  }
//  for (Circle b: circles4) {
//    b.display();
//  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = circles.size()-1; i >= 0; i--) {
    Circle b = circles.get(i);
    if (b.done()) {
      circles.remove(i);
    }
  }

  for (int i = circles2.size()-1; i >= 0; i--) {
    Circle b2 = circles2.get(i);
    if (b2.done()) {
      circles2.remove(i);
    }
  }

//  for (int i = circles3.size()-1; i >= 0; i--) {
//    Circle b = circles3.get(i);
//    if (b.done()) {
//      circles3.remove(i);
//    }
//  }
//
//  for (int i = circles4.size()-1; i >= 0; i--) {
//    Circle b = circles4.get(i);
//    if (b.done()) {
//      circles4.remove(i);
//    }
//  }
  pushMatrix();
  contourBoundaries.display();
  scale(scaleFactor);

  //Finally, draw the diff image to the window, so we can make sure it looks right
  //used to keep scale from interfering with other sketch elements

  //image(opencv.getSnapshot(), 0, 0);

  //Prepare to draw contours
  strokeWeight(0.1);

  // contours and then draw them to screen
  for (Contour contour : opencv.findContours(false, true)) {  //Contours will be sorted by area, largest first

    //Contours are red
    noStroke();

    //stroke(255, 0, 0);
    noFill();

    //Rectangles (bounding boxes) are blue
    //stroke(0, 0, 255);
    //strokeWeight(1);
    //Rectangle rect = contour.getBoundingBox();
    //rect(rect.x, rect.y, rect.width, rect.height);
    //stroke(255,0,0);
    //Get the individual points from the contour
    beginShape();
    for (PVector p : contour.getPolygonApproximation().getPoints()) {
      vertex(p.x, p.y);
    }
    endShape();
  } //end loop

  popMatrix();
  
  if (frameCount%5==0) {
    contourBoundaries.update();
  }













  // The old contour boundaries need to be reset!  
  //  contourBoundaries.resetPoints();
}



//Needed for the camera image to update
void captureEvent(Capture c) {
  c.read();
}

//touchOSC events
void oscEvent(OscMessage theOscMessage){
  String addr = theOscMessage.addrPattern();
  print("### received an osc message.");
  float val = theOscMessage.get(0).floatValue();
  
  if(addr.equals("/1/restit")){ restitutionValue = val;}
  if(addr.equals("/1/radius")){ radius = val;}
  if(addr.equals("/1/red")){ red = val;}
 if(addr.equals("/1/green")){ green = val;}
if(addr.equals("/1/blue")){ blue = val;} 
if(addr.equals("/1/rate")){ creationRate = int(val);}
if(addr.equals("/1/margin")){ margin = val;}

}

