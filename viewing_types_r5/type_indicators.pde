void keyPressed() {
  println(textValue);
  if (keyCode==SHIFT) {
    textValue+=0.01;
  }
  if (keyCode==CONTROL) {
    textValue-=0.01;
  }
}


//************************************************************************************************************************************************************************
//************************************************************************************************************************************************************************
//Left Circle Type
//************************************************************************************
//************************************************************************************
void displayLeftCircleEI() {
  textFont(font, textSize);
  fill(circleFontColor,circleFontOpacity);
  if (eiLeftSaturation <0) {
    text('E', -3,4);
  } 
  else {
    text('I', -3,4);
  }
}

void displayLeftCircleSN() {
  textFont(font, textSize);
  fill(circleFontColor,circleFontOpacity);
  if (snLeftSaturation <0) {
    text('S', -3,4);
  } 
  else {
    text('N', -3,4);
  }
}

void displayLeftCircleTF() {
  textFont(font, textSize);
  fill(circleFontColor,circleFontOpacity);
  if (tfLeftSaturation <0) {
    text('T', -3,4);
  } 
  else {
    text('F', -3,4);
  }
}

void displayLeftCircleJP() {
  textFont(font, textSize);
  fill(circleFontColor,circleFontOpacity);
  if (jpLeftSaturation <0) {
    text('J', -3,4);
  } 
  else {
    text('P', -3,4);
  }
}

//************************************************************************************************************************************************************************
//************************************************************************************************************************************************************************
//Right Circle Type
//************************************************************************************
//************************************************************************************
void displayRightCircleEI() {
  textFont(font, textSize);
  fill(circleFontColor,circleFontOpacity);
  if (eiRightSaturation <0) {
    text('E', -3,4);
  } 
  else {
    text('I', -3,4);
  }
}

void displayRightCircleSN() {
  textFont(font, textSize);
  fill(circleFontColor,circleFontOpacity);
  if (snRightSaturation <0) {
    text('S', -3,4);
  } 
  else {
    text('N', -3,4);
  }
}

void displayRightCircleTF() {
  textFont(font, textSize);
  fill(circleFontColor,circleFontOpacity);
  if (tfRightSaturation <0) {
    text('T', -3,4);
  } 
  else {
    text('F', -3,4);
  }
}

void displayRightCircleJP() {
  textFont(font, textSize);
  fill(circleFontColor,circleFontOpacity);
  if (jpRightSaturation <0) {
    text('J', -3,4);
  } 
  else {
    text('P', -3,4);
  }
}

//************************************************************************************************************************************************************************
//************************************************************************************************************************************************************************
//Type on the bottom
//************************************************************************************
//************************************************************************************


void displayLeftType() {
  
  textFont(font, 32);
fill(110,abs(eiLeftSaturation)*255,(abs(eiLeftSaturation)*60)+40);
  if (eiLeftSaturation <0) {
   
    text('E', 20, height-20);
  } 
  else {
    text('I', 30, height-20);
  }
  
  fill(110,abs(snLeftSaturation)*255,(abs(snLeftSaturation)*60)+40);

  if (snLeftSaturation <0) {
   
    text('S', 45, height-20);
  } 
  else {
    text('N', 45, height-20);
  }
fill(120,abs(tfLeftSaturation)*255,(abs(tfLeftSaturation)*60)+40);

  if (tfLeftSaturation <0) {
   
    text('T', 70, height-20);
  } 
  else {
    text('F', 70, height-20);
  }
fill(130,abs(jpLeftSaturation)*255,(abs(jpLeftSaturation)*60)+40);
  if (jpLeftSaturation <0) {
    
    text('J', 95, height-20);
  } 
  else {
    text('P', 95, height-20);
  }
}

void displayRightType() {
fill(200,abs(eiRightSaturation)*255,(abs(eiRightSaturation)*60)+40);
  if (eiRightSaturation <0) {
    
    text('E', (width/2)+20, height-20);
  } 
  else {
    text('I', (width/2)+30, height-20);
  }fill(215,abs(snRightSaturation)*255,(abs(snRightSaturation)*60)+40);
  if (snRightSaturation <0) {
    
    text('S', (width/2)+45, height-20);
  } 
  else {
    text('N', (width/2)+45, height-20);
  }
fill(230,abs(tfRightSaturation)*255,(abs(tfRightSaturation)*60)+40);
  if (tfRightSaturation <0) {
    
    text('T', (width/2)+70, height-20);
  } 
  else {
    text('F', (width/2)+70, height-20);
  }
fill(245,abs(jpRightSaturation)*255,(abs(jpRightSaturation)*60)+40);
  if (jpRightSaturation <0) {
    
    text('J', (width/2)+95, height-20);
  } 
  else {
    text('P', (width/2)+95, height-20);
  }
}

