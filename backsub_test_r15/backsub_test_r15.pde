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
ArrayList<Circle> extraIntra;
ArrayList<Circle> senseIntuition;
ArrayList<Circle> thinkFeel;
ArrayList<Circle> judgePerception;

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

Attractor eiAttractor;
Attractor snAttractor;
Attractor tfAttractor;
Attractor jpAttractor;


//testing movement of attractors
float snAttractorXpos;
boolean xGrowth;


void setup() {
  size(800, 680);
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
  box2d.setGravity(0, 0);


  // Create ArrayLists
  extraIntra = new ArrayList<Circle>();
  senseIntuition = new ArrayList<Circle>();
  thinkFeel = new ArrayList<Circle>();
  judgePerception = new ArrayList<Circle>();

  boundaries = new ArrayList<Boundary>();

  boundaries.add(new Boundary(0, height-5, width*2, 10));
  boundaries.add(new Boundary(width-5, height/2, 10, height));
  boundaries.add(new Boundary(5, height/2, 10, height));

  contourBoundaries = new LiveSurface();
  
  //setup Attractors
  eiAttractor = new Attractor(12, mouseX, mouseY);
  snAttractor = new Attractor(12, 50, 50);
  tfAttractor = new Attractor(12, width-50, height-50);
  jpAttractor = new Attractor(12, 50, height-50);

}

void draw() {
  //println("This is the frameRate:"+frameRate);
  
  
  //move attactors
   if (snAttractorXpos<0) {
      xGrowth=true;
    } 
    if (snAttractorXpos>height) {
      xGrowth=false;
    }
    if (xGrowth) {
      snAttractorXpos+=2;
    }
    else {

      snAttractorXpos-=4;
    }

//update attractors
  eiAttractor.update(mouseX, mouseY);
  snAttractor.update(50, snAttractorXpos);
//  tfAttractor.update(mouseX, mouseY);
//  jpAttractor.update(mouseX, mouseY);
  
  //redraw background
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

    //Extraversion and Introversion group of circles
    Circle ei = new Circle(random(width), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    extraIntra.add(ei);

    //Sensing and Intuition group of circles
    Circle sn = new Circle(random(width), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    senseIntuition.add(sn);

//    //Thinking and Feeling group of circles
    Circle tf = new Circle(random(width), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    thinkFeel.add(tf);
//
//    //Judging and Perception group of circles
    Circle jp = new Circle(random(width), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    judgePerception.add(jp);

  }
    //updates attractor positions (deletes old location, creates a new one
    eiAttractor.displayEI();


    //Extraversion and Introversion group of circles
    for (int i = 0; i < extraIntra.size()-1; i++) {
      // Look, this is just like what we had before!
      Vec2 force = eiAttractor.attract(extraIntra.get(i));
      extraIntra.get(i).applyForce(force);
      extraIntra.get(i).displayEI();
    }

    //Sensing and Intuition group of circles
    for (int i = 0; i < senseIntuition.size()-1; i++) {
      // Look, this is just like what we had before!
      Vec2 force = snAttractor.attract(senseIntuition.get(i));
      senseIntuition.get(i).applyForce(force);
      senseIntuition.get(i).displaySN();
    }


    //Thinking and Feeling group of circles
    for (int i = 0; i < thinkFeel.size()-1; i++) {
      // Look, this is just like what we had before!
      Vec2 force = tfAttractor.attract(thinkFeel.get(i));
      thinkFeel.get(i).applyForce(force);
      thinkFeel.get(i).displayTF();
    }
    
        //Judgement and Perception group of circles
    for (int i = 0; i < judgePerception.size()-1; i++) {
      // Look, this is just like what we had before!
      Vec2 force = jpAttractor.attract(judgePerception.get(i));
      judgePerception.get(i).applyForce(force);
      judgePerception.get(i).displayJP();
    
  }
  // Display EI circles
  for (Circle b: extraIntra) {
    b.displayEI();
  }
  // Display SN circles
  for (Circle b2: senseIntuition) {
    b2.displaySN();
  }
  
    // Display TF circles
  for (Circle b3: thinkFeel) {
    b3.displayTF();
  }

    // Display TF circles
  for (Circle b4: judgePerception) {
    b4.displayJP();
  }



  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = extraIntra.size()-1; i >= 0; i--) {
    Circle b = extraIntra.get(i);
    if (b.done()) {
      extraIntra.remove(i);
    }
  }

  for (int i = senseIntuition.size()-1; i >= 0; i--) {
    Circle b2 = senseIntuition.get(i);
    if (b2.done()) {
      senseIntuition.remove(i);
    }
  }
  
    for (int i = thinkFeel.size()-1; i >= 0; i--) {
    Circle b2 = thinkFeel.get(i);
    if (b2.done()) {
      thinkFeel.remove(i);
    }
  }
  
    for (int i = judgePerception.size()-1; i >= 0; i--) {
    Circle b2 = judgePerception.get(i);
    if (b2.done()) {
      judgePerception.remove(i);
    }
  }

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
    noStroke();
    noFill();
    Rectangle rect = contour.getBoundingBox();
    rect(rect.x, rect.y, rect.width, rect.height);
    
    //this is the center point of each contour...translate into a variable
    //this variable will be used to calculate attraction forces
    fill(255);
    ellipse(rect.x + (rect.width/2), rect.y+ (rect.height/2),5,5);
    noFill();
    noStroke();
    
    
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
void oscEvent(OscMessage theOscMessage) {
  String addr = theOscMessage.addrPattern();
  print("### received an osc message.");
  float val = theOscMessage.get(0).floatValue();

  if (addr.equals("/1/restit")) { 
    restitutionValue = val;
  }
  if (addr.equals("/1/radius")) { 
    radius = val;
  }
  if (addr.equals("/1/red")) { 
    red = val;
  }
  if (addr.equals("/1/green")) { 
    green = val;
  }
  if (addr.equals("/1/blue")) { 
    blue = val;
  } 
  if (addr.equals("/1/rate")) { 
    creationRate = int(val);
  }
  if (addr.equals("/1/margin")) { 
    margin = val;
  }
}

