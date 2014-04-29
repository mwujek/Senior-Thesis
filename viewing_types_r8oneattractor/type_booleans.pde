void checktypes() {

  if (eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0) {
    leftINFP = true;
  } 
  else { 
    leftINFP = false;
  }

  if (eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0) {
    leftISFP = true;
  } 
  else {
    leftISFP = false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0) {
    leftINTP = true;
  } 
  else {
    leftINTP = false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0) {
    leftINFJ = true;
  } 
  else { 
    leftINFJ = false;
  }


  if (eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0) {
    leftENFP = true;
  } 
  else {
    leftENFP = false;
  }

  if (eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation < 0) {
    leftISTJ = true;
  } 
  else { 
    leftISTJ = false;
  }

  if (eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0) {
    leftENTP = true;
  } 
  else { 
    leftENTP = false;
  }
  if (eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0) {
    leftENFJ = true;
  } 
  else {
    leftENFJ = false;
  }


  if (eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0) {
    leftESFP = true;
  } 
  else { 
    leftESFP = false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0) {
    leftISFJ = true;
  } 
  else { 
    leftISFJ = false;
  }
  if (eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0) {
    leftESTP = true;
  } 
  else { 
    leftESTP = false;
  }
  if (eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0) {
    leftESFJ=true;
  } 
  else {
    leftESFJ=false;
  }


  if (eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation < 0) {
    leftENTJ=true;
  } 
  else {
    leftENTJ=false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0) {
    leftISTP=true;
  } 
  else {
    leftISTP=false;
  }
  if (eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation < 0) {
    leftINTJ = true;
  } 
  else {
    leftINTJ = false;
  }
  if (eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation < 0) {
    leftESTJ=true;
  } 
  else {
    leftESTJ=false;
  }
}//end function

