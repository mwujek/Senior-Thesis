//touchOSC events
void oscEvent(OscMessage theOscMessage) {
  String addr = theOscMessage.addrPattern();
  print("### received an osc message.");
  float val = theOscMessage.get(0).floatValue();


  //OLD VALUES
  if (addr.equals("/1/restit")) { 
    restitutionValue = val;
  }
  if (addr.equals("/1/radius")) { 
    radius = val;
  }
  if (addr.equals("/1/red")) { 
    redLeft = val;
  }
  if (addr.equals("/1/green")) { 
    greenLeft = val;
  }
  if (addr.equals("/1/blue")) { 
    blueLeft = val;
  } 
  if (addr.equals("/1/rate")) { 
    creationRate = int(val);
  }
  if (addr.equals("/1/margin")) { 
    margin = val;
  }

  //NEW VALUES
  //LEFT SIDE************************************************************

  if (addr.equals("/1/leftEI")) { 
    eiLeftSaturation = val;
  }
  if (addr.equals("/1/leftSN")) { 
    snLeftSaturation = val;
  }
  if (addr.equals("/1/leftTF")) { 
    tfLeftSaturation = val;
  }
  if (addr.equals("/1/leftJP")) { 
    jpLeftSaturation = val;
  }

  //RIGHT SIDE************************************************************
  
  if (addr.equals("/1/rightEI")) { 
    eiRightSaturation = val;
  }
  if (addr.equals("/1/rightSN")) { 
    snRightSaturation = val;
  }
  if (addr.equals("/1/rightTF")) { 
    tfRightSaturation = val;
  }
  if (addr.equals("/1/rightJP")) { 
    jpRightSaturation = val;
  }
}

