void checktypes() {

  if (eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0) {
    leftINFP = true;
     left = "INFP";  
  } 
  else { 
    leftINFP = false;
  }

  if (eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0) {
    leftISFP = true;
     left = "ISFP";  
  } 
  else {
    leftISFP = false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0) {
    leftINTP = true;
     left = "INTP";  
  } 
  else {
    leftINTP = false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0) {
    leftINFJ = true;
     left = "INFJ";  
  } 
  else { 
    leftINFJ = false;
  }


  if (eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0) {
    leftENFP = true;
     left = "ENFP";  
  } 
  else {
    leftENFP = false;
  }

  if (eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation < 0) {
    leftISTJ = true;
     left = "ISTJ";  
  } 
  else { 
    leftISTJ = false;
  }

  if (eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0) {
    leftENTP = true;
     left = "ENTP";  
  } 
  else { 
    leftENTP = false;
  }
  if (eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0) {
    leftENFJ = true;
     left = "ENFJ";  
  } 
  else {
    leftENFJ = false;
  }


  if (eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0) {
    leftESFP = true;
     left = "ESFP";  
  } 
  else { 
    leftESFP = false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0) {
    leftISFJ = true;
     left = "ISFJ";  
  } 
  else { 
    leftISFJ = false;
  }
  if (eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0) {
    leftESTP = true;
     left = "ESTP";  
  } 
  else { 
    leftESTP = false;
  }
  if (eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0) {
    leftESFJ=true;
     left = "ESFJ";  
  } 
  else {
    leftESFJ=false;
  }


  if (eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation < 0) {
    leftENTJ=true;
     left = "ENTJ";  
  } 
  else {
    leftENTJ=false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0) {
    leftISTP=true;
     left = "ISTP";  
  } 
  else {
    leftISTP=false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation < 0) {
    leftINTJ = true;
     left = "INTJ";  
  } 
  else {
    leftINTJ = false;
  }
  if (eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation < 0) {
    leftESTJ=true;
     left = "ESTJ";  
  } 
  else {
    leftESTJ=false;
  }


  if (eiRightSaturation > 0 && snRightSaturation > 0 && tfRightSaturation > 0  && jpRightSaturation > 0) {
    rightINFP = true;
     right = "INFP";  
  } 
  else { 
    rightINFP = false;
  }

  if (eiRightSaturation > 0 && snRightSaturation < 0 && tfRightSaturation > 0  && jpRightSaturation > 0) {
    rightISFP = true;
     right = "ISFP";  
  } 
  else {
    rightISFP = false;
  }
  if (eiRightSaturation > 0 && snRightSaturation > 0 && tfRightSaturation < 0  && jpRightSaturation > 0) {
    rightINTP = true;
     right = "INTP";  
  } 
  else {
    rightINTP = false;
  }
  if (eiRightSaturation > 0 && snRightSaturation > 0 && tfRightSaturation > 0  && jpRightSaturation < 0) {
    rightINFJ = true;
     right = "INFJ";  
  } 
  else { 
    rightINFJ = false;
  }


  if (eiRightSaturation < 0 && snRightSaturation > 0 && tfRightSaturation > 0  && jpRightSaturation > 0) {
    rightENFP = true;
     right = "ENFP";  
  } 
  else {
    rightENFP = false;
  }

  if (eiRightSaturation > 0 && snRightSaturation < 0 && tfRightSaturation < 0  && jpRightSaturation < 0) {
    rightISTJ = true;
     right = "ISTJ";  
  } 
  else { 
    rightISTJ = false;
  }

  if (eiRightSaturation < 0 && snRightSaturation > 0 && tfRightSaturation < 0  && jpRightSaturation > 0) {
    rightENTP = true;
     right = "ENTP";  
  } 
  else { 
    rightENTP = false;
  }
  if (eiRightSaturation < 0 && snRightSaturation > 0 && tfRightSaturation > 0  && jpRightSaturation < 0) {
    rightENFJ = true;
     right = "ENFJ";  
  } 
  else {
    rightENFJ = false;
  }


  if (eiRightSaturation < 0 && snRightSaturation < 0 && tfRightSaturation > 0  && jpRightSaturation > 0) {
    rightESFP = true;
     right = "ESFP";  
  } 
  else { 
    rightESFP = false;
  }
  if (eiRightSaturation > 0 && snRightSaturation < 0 && tfRightSaturation > 0  && jpRightSaturation < 0) {
    rightISFJ = true;
     right = "ISFJ";  
  } 
  else { 
    rightISFJ = false;
  }
  if (eiRightSaturation < 0 && snRightSaturation < 0 && tfRightSaturation < 0  && jpRightSaturation > 0) {
    rightESTP = true;
     right = "ESTP";  
  } 
  else { 
    rightESTP = false;
  }
  if (eiRightSaturation < 0 && snRightSaturation < 0 && tfRightSaturation > 0  && jpRightSaturation < 0) {
    rightESFJ=true;
     right = "ESFJ";  
  } 
  else {
    rightESFJ=false;
  }


  if (eiRightSaturation < 0 && snRightSaturation > 0 && tfRightSaturation < 0  && jpRightSaturation < 0) {
    rightENTJ=true;
     right = "ENTJ";  
  } 
  else {
    rightENTJ=false;
  }
  if (eiRightSaturation > 0 && snRightSaturation < 0 && tfRightSaturation < 0  && jpRightSaturation > 0) {
    rightISTP=true;
     right = "ISTP";  
  } 
  else {
    rightISTP=false;
  }
  if (eiRightSaturation > 0 && snRightSaturation > 0 && tfRightSaturation < 0  && jpRightSaturation < 0) {
    rightINTJ = true;
     right = "INTJ";  
  } 
  else {
    rightINTJ = false;
  }
  if (eiRightSaturation < 0 && snRightSaturation < 0 && tfRightSaturation < 0  && jpRightSaturation < 0) {
    rightESTJ=true;
     right = "ESTJ";  
  } 
  else {
    rightESTJ=false;
  }
}//end function




