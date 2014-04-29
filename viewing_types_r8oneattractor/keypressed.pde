void updateAttractors() {
  
  boolean forceApplied = false;
  //toggle attract or repel
float attract = width/2;
float leftRepel = 0;
float rightRepel = width;


  //float leftAttractorDefaultx;
  //float leftAttractorDefaulty;
  //float rightAttractorDefaultx;
  //float rightAttractorDefaulty;

  //toggle attract or repel
  //float leftAttract;
  //float leftRepel;
  //float rightAttract;
  //float rightRepel;


  //type look like:
  //leftENTJ
  //rightISTJ

//com
if(keyPressed){
if (key=='y'){
  forceApplied = true;
  eiAttractorLeft.update(attract, leftAttractorDefaulty);
  eiAttractorRight.update(attract, leftAttractorDefaulty);
}

if (key=='t'){
  forceApplied = true;
  eiAttractorLeft.update(leftRepel, leftAttractorDefaulty);
  eiAttractorRight.update(rightRepel, leftAttractorDefaulty);
}
}
//rules for types
if (leftENTJ && rightENTJ){
  forceApplied = true;
  eiAttractorLeft.update(attract, leftAttractorDefaulty);
  eiAttractorRight.update(attract, leftAttractorDefaulty);
}

if (leftISTJ && rightISTJ){
  forceApplied = true;
  eiAttractorLeft.update(leftRepel, leftAttractorDefaulty);
  eiAttractorRight.update(rightRepel, leftAttractorDefaulty);
}

  if (forceApplied == false) {
 eiAttractorLeft.update(leftAttractorDefaultx, leftAttractorDefaulty);
 eiAttractorRight.update(rightAttractorDefaultx, rightAttractorDefaulty);

  }
}

