void keyPressed() {
  println(textValue);
  if (keyCode==SHIFT) {
    right = "ISTJ";  
    left = "ISTJ";
  }


  if (keyCode==UP) {
    right = "ISTP";  
    left = "ISTP";
  }

  if (keyCode==DOWN) {
    right = "ESFP";  
    left = "ESFP";
  }
}


//************************************************************************************************************************************************************************
//************************************************************************************************************************************************************************
//Left Circle Type
//************************************************************************************
//************************************************************************************
void displayLeftCircleEI() {
  textFont(font, textSize);
  fill(circleFontColor, circleFontOpacity);
  if (eiLeftSaturation <0) {
    text('E', -3, 4);
  } 
  else {
    text('I', -3, 4);
  }
}

void displayLeftCircleSN() {
  textFont(font, textSize);
  fill(circleFontColor, circleFontOpacity);
  if (snLeftSaturation <0) {
    text('S', -3, 4);
  } 
  else {
    text('N', -3, 4);
  }
}

void displayLeftCircleTF() {
  textFont(font, textSize);
  fill(circleFontColor, circleFontOpacity);
  if (tfLeftSaturation <0) {
    text('T', -3, 4);
  } 
  else {
    text('F', -3, 4);
  }
}

void displayLeftCircleJP() {
  textFont(font, textSize);
  fill(circleFontColor, circleFontOpacity);
  if (jpLeftSaturation <0) {
    text('J', -3, 4);
  } 
  else {
    text('P', -3, 4);
  }
}

//************************************************************************************************************************************************************************
//************************************************************************************************************************************************************************
//Right Circle Type
//************************************************************************************
//************************************************************************************
void displayRightCircleEI() {
  textFont(font, textSize);
  fill(circleFontColor, circleFontOpacity);
  if (eiRightSaturation <0) {
    text('E', -3, 4);
  } 
  else {
    text('I', -3, 4);
  }
}

void displayRightCircleSN() {
  textFont(font, textSize);
  fill(circleFontColor, circleFontOpacity);
  if (snRightSaturation <0) {
    text('S', -3, 4);
  } 
  else {
    text('N', -3, 4);
  }
}

void displayRightCircleTF() {
  textFont(font, textSize);
  fill(circleFontColor, circleFontOpacity);
  if (tfRightSaturation <0) {
    text('T', -3, 4);
  } 
  else {
    text('F', -3, 4);
  }
}

void displayRightCircleJP() {
  textFont(font, textSize);
  fill(circleFontColor, circleFontOpacity);
  if (jpRightSaturation <0) {
    text('J', -3, 4);
  } 
  else {
    text('P', -3, 4);
  }
}

//************************************************************************************************************************************************************************
//************************************************************************************************************************************************************************
//Type on the bottom
//************************************************************************************
//************************************************************************************


void displayLeftType() {

  textFont(font, 32);

  if (eiLeftSaturation <0) {
    fill(138, abs((eiLeftSaturation*180)), 237, abs(eiLeftSaturation*100)+40); //blue
    text('E', 20, height-20);
  } 
  else {
    fill(155, abs((eiLeftSaturation*180)), 205, abs(eiLeftSaturation*100)+40); //navy
    text('I', 30, height-20);
  }


  if (snLeftSaturation <0) {

    fill(228, abs((snLeftSaturation*180)), 234, abs(snLeftSaturation*155)+100); //pink
    text('S', 45, height-20);
  } 
  else {
    fill(25, abs((snLeftSaturation*180)), 237, abs(snLeftSaturation*155)+100); //orange
    text('N', 45, height-20);
  }

  if (tfLeftSaturation <0) {

    fill(35, abs((tfLeftSaturation*180)), 255, abs(tfLeftSaturation*155)+100); //yellow
    text('T', 70, height-20);
  } 
  else {
    fill(255, abs((tfLeftSaturation*180)), 235, abs(tfLeftSaturation*155)+100); //red
    text('F', 70, height-20);
  }
  if (jpLeftSaturation <0) {

    fill(89, abs((jpLeftSaturation*180)), 179, abs(jpLeftSaturation*155)+100); //green
    text('J', 95, height-20);
  } 
  else {
    fill(193, abs((jpLeftSaturation*180)), 180, abs(jpLeftSaturation*155)+100); //purple
    text('P', 95, height-20);
  }
}

void displayRightType() {
  if (eiRightSaturation <0) {
    fill(138, abs((eiRightSaturation*180)), 237, abs(eiRightSaturation*155)+100); //blue
    text('E', (width/2)+20, height-20);
  } 
  else {
    fill(155, abs((eiRightSaturation*180)), 205, abs(eiRightSaturation*155)+100); //navy
    text('I', (width/2)+30, height-20);
  }
  if (snRightSaturation <0) {

    fill(228, abs((snRightSaturation*180)), 234, abs(snRightSaturation*155)+100); //pink
    text('S', (width/2)+45, height-20);
  } 
  else {
    fill(25, abs((snRightSaturation*180)), 237, abs(snRightSaturation*155)+100); //orange
    text('N', (width/2)+45, height-20);
  }
  if (tfRightSaturation <0) {
    fill(35, abs((tfRightSaturation*180)), 255, abs(tfRightSaturation*155)+100); //yellow
    text('T', (width/2)+70, height-20);
  } 
  else {
    fill(255, abs((tfRightSaturation*180)), 235, abs(tfRightSaturation*155)+100); //red
    text('F', (width/2)+70, height-20);
  }
  if (jpRightSaturation <0) {

    fill(89, abs((jpRightSaturation*180)), 179, abs(jpRightSaturation*155)+100); //green
    text('J', (width/2)+95, height-20);
  } 
  else {
    fill(193, abs((jpRightSaturation*180)), 180, abs(jpRightSaturation*155)+100); //purple
    text('P', (width/2)+95, height-20);
  }


  //RIGHT SIDE**************************************************************************************************************
  //**************************************************************************************************************
  //**************************************************************************************************************
  //**************************************************************************************************************


  if (eiRightSaturation > 0 && snRightSaturation > 0 && tfRightSaturation > 0  && jpRightSaturation > 0) {
    rightINFP = true;
  } 
  else { 
    rightINFP = false;
  }

  if (eiRightSaturation > 0 && snRightSaturation < 0 && tfRightSaturation > 0  && jpRightSaturation > 0) {
    rightISFP = true;
  } 
  else {
    rightISFP = false;
  }
  if (eiRightSaturation > 0 && snRightSaturation > 0 && tfRightSaturation < 0  && jpRightSaturation > 0) {
    rightINTP = true;
  } 
  else {
    rightINTP = false;
  }
  if (eiRightSaturation > 0 && snRightSaturation > 0 && tfRightSaturation > 0  && jpRightSaturation < 0) {
    rightINFJ = true;
  } 
  else { 
    rightINFJ = false;
  }

  if (eiRightSaturation < 0 && snRightSaturation > 0 && tfRightSaturation > 0  && jpRightSaturation > 0) {
    rightENFP = true;
  } 
  else {
    rightENFP = false;
  }

  if (eiRightSaturation > 0 && snRightSaturation < 0 && tfRightSaturation < 0  && jpRightSaturation < 0) {
    rightISTJ = true;
  } 
  else { 
    rightISTJ = false;
  }

  if (eiRightSaturation < 0 && snRightSaturation > 0 && tfRightSaturation < 0  && jpRightSaturation > 0) {
    rightENTP = true;
  } 
  else { 
    rightENTP = false;
  }
  if (eiRightSaturation < 0 && snRightSaturation > 0 && tfRightSaturation > 0  && jpRightSaturation < 0) {
    rightENFJ = true;
  } 
  else {
    rightENFJ = false;
  }


  if (eiRightSaturation < 0 && snRightSaturation < 0 && tfRightSaturation > 0  && jpRightSaturation > 0) {
    rightESFP = true;
  } 
  else { 
    rightESFP = false;
  }
  if (eiRightSaturation > 0 && snRightSaturation < 0 && tfRightSaturation > 0  && jpRightSaturation < 0) {
    rightISFJ = true;
  } 
  else { 
    rightISFJ = false;
  }
  if (eiRightSaturation < 0 && snRightSaturation < 0 && tfRightSaturation < 0  && jpRightSaturation > 0) {
    rightESTP = true;
  } 
  else { 
    rightESTP = false;
  }
  if (eiRightSaturation < 0 && snRightSaturation < 0 && tfRightSaturation > 0  && jpRightSaturation < 0) {
    rightESFJ=true;
  } 
  else {
    rightESFJ=false;
  }


  if (eiRightSaturation < 0 && snRightSaturation > 0 && tfRightSaturation < 0  && jpRightSaturation < 0) {
    rightENTJ=true;
  } 
  else {
    rightENTJ=false;
  }
  if (eiRightSaturation > 0 && snRightSaturation < 0 && tfRightSaturation < 0  && jpRightSaturation > 0) {
    rightISTP=true;
  } 
  else {
    rightISTP=false;
  }
  if (eiRightSaturation > 0 && snRightSaturation > 0 && tfRightSaturation < 0  && jpRightSaturation < 0) {
    rightINTJ = true;
  } 
  else {
    rightINTJ = false;
  }
  if (eiRightSaturation < 0 && snRightSaturation < 0 && tfRightSaturation < 0  && jpRightSaturation < 0) {
    rightESTJ=true;
  } 
  else {
    rightESTJ=false;
  }
}//end lopps

