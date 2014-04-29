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


//*************************************************LEFT SIDE*************************************************

if(eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0){
	leftINFP = true;
} else{ leftINFP = false;}

if(eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0){
	leftISFP = true;
} else {leftISFP = false;}
if(eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0){
	leftINTP = true;
} else {leftINTP = false;}
if(eiLeftSaturation > 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0){
	leftINFJ = true;
} else { leftINFJ = false;}


if(eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0){
	leftENFP = true;
} else {leftENFP = false;}
if(eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0){
	leftESFP = true;
} else { leftESFP = false;}
if(eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0){
	leftENTP = true;
} else { leftENTP = false;}
if(eiLeftSaturation < 0 && snLeftSaturation > 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0){
	leftENFJ = true;
} else {
	leftENFJ = false;
}


if(eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0){
	leftESFP = true;
} else { leftESFP = false;}
if(eiLeftSaturation > 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation > 0){
	leftISFP = true;
} else { leftISFP = false;}
if(eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0){
	leftESTP = true;
} else { leftESTP = false;}
if(eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation > 0  && jpLeftSaturation < 0){
	leftESFJ=true;
} else {leftESFJ=false;}


if(eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0){
	leftESTP=true;
} 
if(eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0){
}
if(eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0){
}
if(eiLeftSaturation < 0 && snLeftSaturation < 0 && tfLeftSaturation < 0  && jpLeftSaturation > 0){
}