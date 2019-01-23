void toggleSMD(boolean theFlag) {
  if (theFlag==true) {
    SMD = true;
  } else {
    SMD = false; 

    byte out[] = new byte[3];
    out[0] = byte(0);
    out[1] = byte(0);
    out[2] = byte(0);
    Arduino.write(out);
  }
}

void toggleDF(boolean theFlag) {
  if (theFlag==true) {
    DF = true;
  } else {
    DF = false;
  }
}

void checkBox(float[] a) {
  coloration = a;
}
