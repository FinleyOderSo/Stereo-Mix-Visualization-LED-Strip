void arduino(){

  color colArd = color(r, g, b);

  byte out[] = new byte[3];
  out[0] = byte(r);
  out[1] = byte(g);
  out[2] = byte(b);

  timing += 1;

  if (timing == 4) {
    Arduino.write(out);
    timing = 0;
  }
}  
