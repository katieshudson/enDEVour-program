

boolean isCanValid (float b, float p, float m){
  float total = (b+p+m);
  if( (p >= (0.1*total)) && (p >= 0.5*b) ){
    return true;
  } else {
    return false;
  }
}

boolean isCanValid1 (float b, float p, float m){
  float total = (b+p+m);
  if( (p >= (0.1*total)) && (p >= 0.5*b) ){
    return true;
  }
  
  return false;
}


boolean isCanValid2 (float b, float p, float m){
  float total = (b+p+m);
  if(p < (0.1*total)){
    return false;
  }
  
  if(p < (0.5*b)){
    return false;
  }
  
  return true;
}


int mynumber = 2;

mynumber += 3; // nynumber = mynumber + 3;
mynumber -= 3; // nynumber = mynumber - 3;
mynumber *= 3; // nynumber = mynumber * 3;
