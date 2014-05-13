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
float gravityValue = -15;
float decreaseOpacitySpeed =  0.35;
int circleFontColor = 0;
int circleFontOpacity= 50;
int radiusDiff = 10;
float growRate = 0.2;
float deflateRate = 0.1;
//float radius = 42; //old
float setRadius =55;
float textSize=12;
float radiusDifference=20;
float creationRate = 10; //frameCount% creationRate =0;
boolean bgRefresh=false;
float margin;
float growthAmount = 1;
int strengthForce=2000;


float addedMargin;


//sound
import ddf.minim.*;

Minim minim;
AudioSample normal;
AudioSample repel;
AudioSample attracted;
AudioSample snapshot;
AudioSample change;

AudioSample one;
AudioSample two;
AudioSample three;
AudioSample four;
AudioSample five;
AudioSample six;
//AudioPlayer groove;




//data
boolean runonce=true;
boolean runonce2=true;
boolean runonce3=true;
boolean oneSnapshot=true;

Table table;

int timePassed;

String left ="ISFP";  //which row to look at
String right= "ISFP"; //which col to look at
//random size for each circle
float newSize;

//booleans for types
//left side
boolean leftISTJ = false;
boolean leftISFJ = false;
boolean leftINFJ = false;
boolean leftINTJ = false;
boolean leftISTP = false;
boolean leftISFP = false;
boolean leftINFP = false;
boolean leftINTP = false;
// = false;
boolean leftESTP = false;
boolean leftESFP = false;
boolean leftENFP = false;
boolean leftENTP = false;
boolean leftESTJ = false;
boolean leftESFJ = false;
boolean leftENFJ = false;
boolean leftENTJ = false;

//right side 
boolean rightISTJ =false;
boolean rightISFJ =false;
boolean rightINFJ =false;
boolean rightINTJ =false;
boolean rightISTP =false;
boolean rightISFP =false;
boolean rightINFP =false;
boolean rightINTP =false;
//
boolean rightESTP =false;
boolean rightESFP =false;
boolean rightENFP =false;
boolean rightENTP =false;
boolean rightESTJ =false;
boolean rightESFJ =false;
boolean rightENFJ =false;
boolean rightENTJ =false;



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

float restartValue =0.0f;
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

PImage bgLeft;
PImage bg;


Capture video;
OpenCV opencv;
OpenCV opencvLeft;
OpenCV opencvRight;

//Scaling will speed up the program 
int scaleFactor = 10;

//float radius = 10f;

float restitutionValue = 0.0f;
float blurValue=1;

boolean toggleTrue=true;

//old
Attractor eiAttractorLeft;
Attractor snAttractorLeft;
Attractor tfAttractorLeft;
Attractor jpAttractorLeft;

Attractor eiAttractorRight;
Attractor snAttractorRight;
Attractor tfAttractorRight;
Attractor jpAttractorRight;

Attractor attractorRight;
Attractor attractorLeft;



float attractorLeftXpos;
float attractorLeftYpos;

float attractorRightXpos;
float attractorRightYpos;


//positions of attracting anchors





//testing movement of attractors

boolean xGrowth;

//default positions for attractors
float leftAttractorDefaultx;
float leftAttractorDefaulty;
float rightAttractorDefaultx;
float rightAttractorDefaulty;






void setup() {
  size(960, 540); //wideangle camera
  //size(800,680); //built-in camera
  
  //setup sounds
  minim = new Minim(this);
  normal = minim.loadSample("normal.wav", 512);
  repel = minim.loadSample("negative.wav", 512);
  attracted = minim.loadSample("attract.wav", 512);
  snapshot = minim.loadSample("snapshot.wav", 512);
  change = minim.loadSample("small3.wav", 512);
   one = minim.loadSample("one.wav", 512);
 two = minim.loadSample("two.wav", 512);
 three = minim.loadSample("three.wav", 512);
 four = minim.loadSample("four.wav", 512);
 five = minim.loadSample("five.wav", 512);
  six = minim.loadSample("six.wav", 512);

  //groove = minim.loadFile("groove.wav", 2048);
  
  background(0);
  
  String[] cameras = Capture.list();

  for (int i = 0; i < cameras.length; i++) {
    println(cameras[i]);
  }
  
  //load table stuff
  table = loadTable("types.csv", "header");

  //fonts
  font = loadFont("DIN-Bold-48.vlw");
  textFont(font, 32);

  //colorMode HSB

  colorMode(HSB);

  

//initial position @ default
leftAttractorDefaultx =width/4;
leftAttractorDefaulty =height - 200;
rightAttractorDefaultx =width/2 + (width/4);
rightAttractorDefaulty =height - 200;

  attractorLeftXpos = leftAttractorDefaultx;
  attractorLeftYpos = leftAttractorDefaulty;

  attractorRightXpos = leftAttractorDefaultx;
  attractorRightYpos = leftAttractorDefaulty;





  oscP5 = new OscP5(this, 8000); //new OSC object 
  //pushMatrix();
  //translate(250,-250);

 //New PImage to store the background image to compare against
  bg = new PImage(width/scaleFactor, height/scaleFactor);
  
 
  
 
  //video = new Capture(this, (width/scaleFactorW)/2, height/scaleFactorH); //broken if '/2'

  //New Capture object to get video from the webcam
  video = new Capture(this, width/scaleFactor, height/scaleFactor);
  video.start();

   //New OpenCV object to calc difference between the two, return contours, etc.
  opencv = new OpenCV(this, video, false);  //false here means use grayscale only
 
  // popMatrix();

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
  boundaries.add(new Boundary(5, height/2, 10, height)); //BOTTOM



  contourBoundaries = new LiveSurface();

  //setup Attractors
  attractorLeft = new Attractor(2, attractorLeftXpos, attractorLeftYpos);
  
  attractorRight = new Attractor(2, attractorRightXpos, attractorRightYpos);

}
//**************************************************************
//**************************************************************
//**************************************************************
//**************************************************************
//**************************************************************
///////////DRAW
//**************************************************************
//**************************************************************
//**************************************************************
//**************************************************************
//**************************************************************
void draw() {

  checktypes();
  updateAttractors();
if(restartValue==1.0){
  toggleTrue=true;
}else{
  toggleTrue=false;
}
  if (bgRefresh || toggleTrue) {
    background(0);
    
  }else{
    noStroke();
    fill(0);
    ellipse(70,height-25,120,120);
    ellipse((width/2+70),height-25,120,120);
  }
    
    
    //addedmargin here
    if(eiLeftSaturation<0){
    addedMargin=abs(eiLeftSaturation)/2;
    }  
  println(strengthForce);
  


  ////update attractors
 
 
 
  
  //redraw background

  //Update OpenCV object with latest from camera
  //  pushMatrix();
  //  translate(300,-100);
  opencv.loadImage(video);
  opencv.flip(OpenCV.HORIZONTAL);
  
  
      opencv.loadImage(video);


  //Whenever you press a ssmm, we take a snapshot and save it as our
  //new background image to compare against.
  if (timePassed==25) {
   if(oneSnapshot){
     snapshot.trigger();
     oneSnapshot=false;
     bg = opencv.getSnapshot();
   }
  }
  if(mousePressed){
    bg = opencv.getSnapshot();
  }

  //Calc the difference between the bg image and the OpenCV image
  //and set the OpenCV image to that difference.
  //Image diff
  opencv.diff(bg);


  //Perform various image adjustments to brighten just the foreground (subject)
  //The items below may require a lot of tweaking to work best with your lighting setup
  opencv.dilate();
  opencv.erode(); //scott added
  opencv.blur(1);
  opencv.brightness(90);//default==40
  opencv.contrast(1.9);  //1.0+ increases contrast
  opencv.inRange(120, 255);  //Pixels within this range are made white, others made black
  
 

  // popMatrix();

  //Begin BOX2d
  box2d.step();   



  //surface.display();
  //contourBoundaries.display();
//  if (keyPressed) {
//    if (key ==CODED) {
//      if (keyCode == UP) {
//        radius+=0.3;
//      }
//      if (keyCode == DOWN && radius > 1) {
//        radius-=0.3;
//      }
//      if (keyCode == LEFT && restitutionValue > 0) {
//        restitutionValue-=0.01;
//      }
//      if (keyCode == RIGHT && restitutionValue < 1.5) {
//        restitutionValue+=0.01;
//      }
//    }
//  }


  // Every 'x amount' of frames, create a new circle object

  if (frameCount % creationRate ==0) { 
   
    //Extraversion and Introversion group of circles
    Circle eiL = new Circle(random(width/2), -50,  restitutionValue);
    extraIntraLeft.add(eiL);

    //Sensing and Intuition group of circles
    Circle snL = new Circle(random(width/2), -50,  restitutionValue);
    senseIntuitionLeft.add(snL);

    //    //Thinking and Feeling group of circles
    Circle tfL = new Circle(random(width/2), -50, restitutionValue);
    thinkFeelLeft.add(tfL);
    //
    //    //Judging and Perception group of circles
    Circle jpL = new Circle(random(width/2), -50, restitutionValue);
    judgePerceptionLeft.add(jpL);


    //RIGHT SIDE

    //Extraversion and Introversion group of circles
    Circle eiR = new Circle(random(width/2, width), -50,  restitutionValue);
    extraIntraRight.add(eiR);

    //Sensing and Intuition group of circles
    Circle snR = new Circle(random(width/2, width), -50,  restitutionValue);
    senseIntuitionRight.add(snR);

    //    //Thinking and Feeling group of circles
    Circle tfR = new Circle(random(width/2, width), -50,  restitutionValue);
    thinkFeelRight.add(tfR);
    //
    //    //Judging and Perception group of circles
    Circle jpR = new Circle(random(width/2, width), -50,  restitutionValue);
    judgePerceptionRight.add(jpR);
  }


  //updates attractor positions (deletes old location, creates a new one
  attractorRight.displayEIRight();
  attractorRight.displayEILeft();



  //LEFT SIDE ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Extraversion and Introversion group of circles
  for (int i = 0; i < extraIntraLeft.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = attractorLeft.attract(extraIntraLeft.get(i));
    extraIntraLeft.get(i).applyForce(force);
    extraIntraLeft.get(i).displayEILeft();
  }

  //Sensing and Intuition group of circles
  for (int i = 0; i < senseIntuitionLeft.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = attractorLeft.attract(senseIntuitionLeft.get(i));
    senseIntuitionLeft.get(i).applyForce(force);
    senseIntuitionLeft.get(i).displaySNLeft();
  }


  //Thinking and Feeling group of circles
  for (int i = 0; i < thinkFeelLeft.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = attractorLeft.attract(thinkFeelLeft.get(i));
    thinkFeelLeft.get(i).applyForce(force);
    thinkFeelLeft.get(i).displayTFLeft();
  }

  //Judgement and Perception group of circles
  for (int i = 0; i < judgePerceptionLeft.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = attractorLeft.attract(judgePerceptionLeft.get(i));
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



  // deleted when done is true (off screen or opacity <20
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
    Vec2 force = attractorRight.attract(extraIntraRight.get(i));
    extraIntraRight.get(i).applyForce(force);
    extraIntraRight.get(i).displayEIRight();
  }

  //Sensing and Intuition group of circles
  for (int i = 0; i < senseIntuitionRight.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = attractorRight.attract(senseIntuitionRight.get(i));
    senseIntuitionRight.get(i).applyForce(force);
    senseIntuitionRight.get(i).displaySNRight();
  }


  //Thinking and Feeling group of circles
  for (int i = 0; i < thinkFeelRight.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = attractorRight.attract(thinkFeelRight.get(i));
    thinkFeelRight.get(i).applyForce(force);
    thinkFeelRight.get(i).displayTFRight();
  }

  //Judgement and Perception group of circles
  for (int i = 0; i < judgePerceptionRight.size()-1; i++) {
    // Look, this is just like what we had before!
    Vec2 force = attractorRight.attract(judgePerceptionRight.get(i));
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


  //delete when done is true (either off screen or opacity <20)
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
  scale(scaleFactorW, scaleFactorH);

  //image(opencv.getSnapshot(), 48, 0); //Right Side WIDEANGLE
  //image(opencv.getSnapshot(), 0, 0);

  popMatrix();






  if (frameCount%5==0) {
    contourBoundaries.update();
  }
  //translate(550,0); ONLY CHANGES DISPLAY...not the box2d contour
  contourBoundaries.display();


  //DRAW LINE DOWN THE MIDDLE
  stroke(60);
  line(width/2, 0, width/2, height); 

  displayLeftType();
  displayRightType();
  textValue = constrain (textValue, -1, 1);
  timePassed = millis()/1000;
  if(timePassed<15){
    beginningFrame();
  }
  
} //end of draw loop

void beginningFrame(){
  fill(255,200);
  rect(0,0,width,height);
  fill(0);
  text("Please stand outside of the installation!", width/6,100);
  text("Background substraction snapshot in: "+(25-timePassed)+" seconds", width/6,150);
  
}



//Needed for the camera image to update
void captureEvent(Capture c) {
  c.read();
}


