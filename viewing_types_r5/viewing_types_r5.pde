import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import oscP5.*;
import netP5.*;

//settings
float gravityValue = 55;
float decreaseOpacitySpeed =  0.2;
int circleFontColor = 0;
int circleFontOpacity= 50;
int radiusDiff = 10;
float growRate = 0.2;
float deflateRate = 0.1;
float textSize = 12;
float radius = 16;
float radiusDifference= 20;
float creationRate = 4; //frameCount% creationRate =0;
boolean bgRefresh=true;

//No need to run all the OpenCV stuff at full res;
//that slows things down a lot.
int scaleFactorW = 10;
int scaleFactorH = 10;


//circle colors (fill)
float eiLeftSaturation = 0.0f;
float snLeftSaturation = 0.0f;
float tfLeftSaturation = 0.0f;
float jpLeftSaturation = 0.0f;

float eiRightSaturation = 0.0f;
float snRightSaturation = 0.0f;
float tfRightSaturation = 0.0f;
float jpRightSaturation = 0.0f;

//circle type font

float eiLeftTypeSaturation = abs(0.0f) *255;
float snLeftTypeSaturation = abs(0.0f) *255;
float tfLeftTypeSaturation = abs(0.0f) *255;
float jpLeftTypeSaturation = abs(0.0f) *255;

float eiRightTypeSaturation = abs(0.0f) *255;
float snRightTypeSaturation = abs(0.0f) *255;
float tfRightTypeSaturation = abs(0.0f) *255;
float jpRightTypeSaturation = abs(0.0f) *255;




PFont font;
float textValue;
String eValue ="";
String sValue ="";
String tValue ="";
String jValue = "";

//TouchOSC variables + import
OscP5 oscP5;
//float red = 0.0f;
//float green = 0.0f;
//float blue = 0.0f;
//float creationRate = 0.0f;

float redLeft = 255;
float greenLeft = 200;
float blueLeft = 55;

float redRight = 50;
float greenRight = 100;
float blueRight = 255;



// A list for all of the circles
ArrayList<Circle> extraIntraLeft;
ArrayList<Circle> senseIntuitionLeft;
ArrayList<Circle> thinkFeelLeft;
ArrayList<Circle> judgePerceptionLeft;

ArrayList<Circle> extraIntraRight;
ArrayList<Circle> senseIntuitionRight;
ArrayList<Circle> thinkFeelRight;
ArrayList<Circle> judgePerceptionRight;


ArrayList<Boundary> boundaries;


//Surface surface;
LiveSurface contourBoundaries;

Box2DProcessing box2d;  

PImage bg;

Capture video;
OpenCV opencv;


//float radius = 10f;

float restitutionValue = 0.0f;
float blurValue=1;
float margin= 0.0f;

Attractor eiAttractorLeft;
Attractor snAttractorLeft;
Attractor tfAttractorLeft;
Attractor jpAttractorLeft;

Attractor eiAttractorRight;
Attractor snAttractorRight;
Attractor tfAttractorRight;
Attractor jpAttractorRight;



float eiAttractorLeftXpos;
float eiAttractorLeftYpos;
float snAttractorLeftXpos;
float snAttractorLeftYpos;
float tfAttractorLeftXpos;
float tfAttractorLeftYpos;
float jpAttractorLeftXpos;
float jpAttractorLeftYpos;
float eiAttractorRightXpos;
float eiAttractorRightYpos;
float snAttractorRightXpos;
float snAttractorRightYpos;
float tfAttractorRightXpos;
float tfAttractorRightYpos;
float jpAttractorRightXpos;
float jpAttractorRightYpos;

//positions of attracting anchors





//testing movement of attractors
float snAttractorXpos;
boolean xGrowth;


void setup() {
  size(960, 540);
  background(0);
    String[] cameras = Capture.list();

  for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
  
  //fonts
  font = loadFont("DIN-Bold-48.vlw");
  textFont(font, 32);
  
  //colorMode HSB
  
  colorMode(HSB);
  
  
  
  
eiAttractorLeftXpos = width/4;
eiAttractorLeftYpos = height - 200;
snAttractorLeftXpos = width/4;
snAttractorLeftYpos = height - 200;
tfAttractorLeftXpos = width/4;
tfAttractorLeftYpos = height - 200; 
jpAttractorLeftXpos = width/4;
jpAttractorLeftYpos = height - 200;
eiAttractorRightXpos = width/2 + (width/4);
eiAttractorRightYpos = height - 200;
snAttractorRightXpos = width/2 + (width/4);
snAttractorRightYpos = height - 200;
tfAttractorRightXpos = width/2 + (width/4);
tfAttractorRightYpos = height - 200;
jpAttractorRightXpos = width/2 + (width/4);
jpAttractorRightYpos = height - 200;
  
  
  
  
  
  oscP5 = new OscP5(this, 8000); //new OSC object 


  //New PImage to store the background image to compare against
  bg = new PImage((width/scaleFactorW), height/scaleFactorH);
  //bgLeft = new PImage(width/scaleFactor, height/scaleFactor);
  //bgLeftDIS = bgLeft.get(0, 0, width/2, height); 

  //New Capture object to get video from the webcam
  //video = new Capture(this, width/scaleFactorW, height/scaleFactorH);
  video = new Capture(this, (width/scaleFactorW), height/scaleFactorH,"USB_Camera");
  //video = new Capture(this, width,height,"USB_Camera");
  video.start();

  //New OpenCV object to calc difference between the two, return contours, etc.
  opencv = new OpenCV(this, video, false);  //false here means use grayscale only

  // Initialize and create the Box2D world
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
  box2d.setGravity(0, gravityValue);


  // Create ArrayLists
  extraIntraLeft = new ArrayList<Circle>();
  senseIntuitionLeft = new ArrayList<Circle>();
  thinkFeelLeft = new ArrayList<Circle>();
  judgePerceptionLeft = new ArrayList<Circle>();

  extraIntraRight = new ArrayList<Circle>();
  senseIntuitionRight = new ArrayList<Circle>();
  thinkFeelRight = new ArrayList<Circle>();
  judgePerceptionRight = new ArrayList<Circle>();

  boundaries = new ArrayList<Boundary>();

  boundaries.add(new Boundary(0, height-5, width*2, 10)); //LEFT
  boundaries.add(new Boundary(width-5, height/2, 10, height)); //RIGHT
  boundaries.add(new Boundary(width/2, height/2, 10, height)); //MIDDLE
  //boundaries.add(new Boundary(5, height/2, 10, height)); //BOTTOM
   


  contourBoundaries = new LiveSurface();

  //setup Attractors
  eiAttractorLeft = new Attractor(2, eiAttractorLeftXpos, eiAttractorLeftYpos);
  snAttractorLeft = new Attractor(2, snAttractorLeftXpos, snAttractorLeftYpos);
  tfAttractorLeft = new Attractor(2, tfAttractorLeftXpos, tfAttractorLeftYpos );
  jpAttractorLeft = new Attractor(2, jpAttractorLeftXpos, jpAttractorLeftYpos);

  eiAttractorRight = new Attractor(2, eiAttractorRightXpos, eiAttractorRightYpos);
  snAttractorRight = new Attractor(2, snAttractorRightXpos, snAttractorRightYpos);
  tfAttractorRight = new Attractor(2, tfAttractorRightXpos, tfAttractorRightYpos);
  jpAttractorRight = new Attractor(2, jpAttractorRightXpos, jpAttractorRightYpos);
}

void draw() {
  //println(eiLeftSaturation);


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

if(bgRefresh){
  background(0);
}
  
  
////update attractors
// eiAttractorLeft.update(eiAttractorLeftXpos *10, eiAttractorLeftYpos *10);
//  snAttractorLeft.update(snAttractorLeftXpos *10, snAttractorLeftYpos *10);
//  tfAttractorLeft.update(tfAttractorLeftXpos *10, tfAttractorLeftYpos *10);
//  jpAttractorLeft.update(jpAttractorLeftXpos *10, jpAttractorLeftYpos *10);
//
//  eiAttractorRight.update(eiAttractorRightXpos *10, eiAttractorRightYpos *10);
//  snAttractorRight.update(snAttractorRightXpos *10, snAttractorRightYpos *10);
//  tfAttractorRight.update(tfAttractorRightXpos *10, tfAttractorRightYpos *10);
//  jpAttractorRight.update(jpAttractorRightXpos *10, jpAttractorRightYpos *10);

  //redraw background


  //Update OpenCV object with latest from camera
  opencv.loadImage(video);
  opencv.flip(OpenCV.HORIZONTAL);
  //bgLeft = bg.get(0, 0, width/2, height);
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

  opencv.blur(12);
  //opencv.erode();
  opencv.brightness(40);
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

  if (frameCount % creationRate ==0) {  

    //Extraversion and Introversion group of circles
    Circle eiL = new Circle(random(width/2), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    extraIntraLeft.add(eiL);

    //Sensing and Intuition group of circles
    Circle snL = new Circle(random(width/2), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    senseIntuitionLeft.add(snL);

    //    //Thinking and Feeling group of circles
    Circle tfL = new Circle(random(width/2), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    thinkFeelLeft.add(tfL);
    //
    //    //Judging and Perception group of circles
    Circle jpL = new Circle(random(width/2), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    judgePerceptionLeft.add(jpL);


    //RIGHT SIDE

    //Extraversion and Introversion group of circles
    Circle eiR = new Circle(random(width/2,width), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    extraIntraRight.add(eiR);

    //Sensing and Intuition group of circles
    Circle snR = new Circle(random(width/2,width), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    senseIntuitionRight.add(snR);

    //    //Thinking and Feeling group of circles
    Circle tfR = new Circle(random(width/2,width), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    thinkFeelRight.add(tfR);
    //
    //    //Judging and Perception group of circles
    Circle jpR = new Circle(random(width/2,width), -50, random(radius, radius+10), radiusDifference, restitutionValue, margin);
    judgePerceptionRight.add(jpR);

  }


  //updates attractor positions (deletes old location, creates a new one
  eiAttractorRight.displayEIRight();
  eiAttractorRight.displayEILeft();



//LEFT SIDE ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Extraversion and Introversion group of circles
  for (int i = 0; i < extraIntraLeft.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = eiAttractorLeft.attract(extraIntraLeft.get(i));
    extraIntraLeft.get(i).applyForce(force);
    extraIntraLeft.get(i).displayEILeft();
  }

  //Sensing and Intuition group of circles
  for (int i = 0; i < senseIntuitionLeft.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = snAttractorLeft.attract(senseIntuitionLeft.get(i));
    senseIntuitionLeft.get(i).applyForce(force);
    senseIntuitionLeft.get(i).displaySNLeft();
  }


  //Thinking and Feeling group of circles
  for (int i = 0; i < thinkFeelLeft.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = tfAttractorLeft.attract(thinkFeelLeft.get(i));
    thinkFeelLeft.get(i).applyForce(force);
    thinkFeelLeft.get(i).displayTFLeft();
  }

  //Judgement and Perception group of circles
  for (int i = 0; i < judgePerceptionLeft.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = jpAttractorLeft.attract(judgePerceptionLeft.get(i));
    judgePerceptionLeft.get(i).applyForce(force);
    judgePerceptionLeft.get(i).displayJPLeft();
  }

  // Display EI circles
  for (Circle b: extraIntraLeft) {
    b.displayEILeft();
  }
  // Display SN circles
  for (Circle b2: senseIntuitionLeft) {
    b2.displaySNLeft();
  }

  // Display TF circles
  for (Circle b3: thinkFeelLeft) {
    b3.displayTFLeft();
  }

  // Display TF circles
  for (Circle b4: judgePerceptionLeft) {
    b4.displayJPLeft();
  }



  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = extraIntraLeft.size()-1; i >= 0; i--) {
    Circle b = extraIntraLeft.get(i);
    if (b.done()) {
      extraIntraLeft.remove(i);
    }
  }

  for (int i = senseIntuitionLeft.size()-1; i >= 0; i--) {
    Circle b2 = senseIntuitionLeft.get(i);
    if (b2.done()) {
      senseIntuitionLeft.remove(i);
    }
  }

  for (int i = thinkFeelLeft.size()-1; i >= 0; i--) {
    Circle b2 = thinkFeelLeft.get(i);
    if (b2.done()) {
      thinkFeelLeft.remove(i);
    }
  }

  for (int i = judgePerceptionLeft.size()-1; i >= 0; i--) {
    Circle b2 = judgePerceptionLeft.get(i);
    if (b2.done()) {
      judgePerceptionLeft.remove(i);
    }
  }

//RIGHT SIDE ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Extraversion and Introversion group of circles
  for (int i = 0; i < extraIntraRight.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = eiAttractorRight.attract(extraIntraRight.get(i));
    extraIntraRight.get(i).applyForce(force);
    extraIntraRight.get(i).displayEIRight();
  }

  //Sensing and Intuition group of circles
  for (int i = 0; i < senseIntuitionRight.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = snAttractorRight.attract(senseIntuitionRight.get(i));
    senseIntuitionRight.get(i).applyForce(force);
    senseIntuitionRight.get(i).displaySNRight();
  }


  //Thinking and Feeling group of circles
  for (int i = 0; i < thinkFeelRight.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = tfAttractorRight.attract(thinkFeelRight.get(i));
    thinkFeelRight.get(i).applyForce(force);
    thinkFeelRight.get(i).displayTFRight();
  }

  //Judgement and Perception group of circles
  for (int i = 0; i < judgePerceptionRight.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = jpAttractorRight.attract(judgePerceptionRight.get(i));
    judgePerceptionRight.get(i).applyForce(force);
    judgePerceptionRight.get(i).displayJPRight();
  }

  // Display EI circles
  for (Circle b: extraIntraRight) {
    b.displayEIRight();
  }
  // Display SN circles
  for (Circle b2: senseIntuitionRight) {
    b2.displaySNRight();
  }

  // Display TF circles
  for (Circle b3: thinkFeelRight) {
    b3.displayTFRight();
  }

  // Display TF circles
  for (Circle b4: judgePerceptionRight) {
    b4.displayJPRight();
  }



  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = extraIntraRight.size()-1; i >= 0; i--) {
    Circle b = extraIntraRight.get(i);
    if (b.done()) {
      extraIntraRight.remove(i);
    }
  }

  for (int i = senseIntuitionRight.size()-1; i >= 0; i--) {
    Circle b2 = senseIntuitionRight.get(i);
    if (b2.done()) {
      senseIntuitionRight.remove(i);
    }
  }

  for (int i = thinkFeelRight.size()-1; i >= 0; i--) {
    Circle b2 = thinkFeelRight.get(i);
    if (b2.done()) {
      thinkFeelRight.remove(i);
    }
  }

  for (int i = judgePerceptionRight.size()-1; i >= 0; i--) {
    Circle b2 = judgePerceptionRight.get(i);
    if (b2.done()) {
      judgePerceptionRight.remove(i);
    }
  }

  pushMatrix();
  //contourBoundaries.display();
  scale(scaleFactorW, scaleFactorH);

  //Finally, draw the diff image to the window, so we can make sure it looks right
  //used to keep scale from interfering with other sketch elements

  //image(opencv.getSnapshot(), 0, 0);

  //Prepare to draw contours
  strokeWeight(0.1);
  popMatrix();






  if (frameCount%5==0) {
    contourBoundaries.update();
  }

  contourBoundaries.display();
  
  //DRAW LINE DOWN THE MIDDLE
  stroke(60);
  line(width/2,0,width/2,height); 
  
  displayLeftType();
  displayRightType();
  textValue = constrain (textValue, -1, 1);
  
} //end of draw loop



//Needed for the camera image to update
void captureEvent(Capture c) {
  c.read();
}



