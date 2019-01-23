void Draw(){

  fill(50,50,50);
  rect(width - 315,0,315,height);
  
  fill(255,255,255);
  textFont(pfontNormal);
  text("Decrease Rate", width - 251, 160);
  text("Enable LED Communication", width - 251, 30);
  text("Display Frequencies", width - 251, 95);
  
  textFont(pfontSmall);
  text("Color Original", width - 285, height - 157);
  text("Color Modified", width - 285, height - 77);
  
  fill(255,0,0);
  rect(35,65,390,50);
  fill(0,255,0);
  rect(35,120,390,50);
  fill(0,0,255);
  rect(35,175,390,50);
  
  textFont(pfontLarge);
  fill(255,255,255);
  text("Red", 60, 100);
  text("Green", 50, 155);
  text("Blue", 60, 210);
  
  text("Red", 365, 100);
  text("Green", 355, 155);
  text("Blue", 365, 210);

  fill(50,50,50);
  text("Low", 123, 50);
  text("Mid", 215, 50);
  text("High", 300, 50);
  
  if(DF == true){
    for (int i = 0; i < 144; i++) {
      strength = 15;
  
      stroke(0 + i * 2, 0, 255 - i * 2, fft.getBand(i) * strength);
      volume = 10 + i / 8;
  
      line(0 + i * freqWidth, height, 0 + i * freqWidth, height - fft.getBand(i) * generalVolumeMP);
      line(0 + i * freqWidth + 1, height, 0 + i * freqWidth + 1, height - fft.getBand(i) * generalVolumeMP);
      line(0 + i * freqWidth + 2, height, 0 + i * freqWidth + 2, height - fft.getBand(i) * generalVolumeMP);
      line(0 + i * freqWidth + 3, height, 0 + i * freqWidth + 3, height - fft.getBand(i) * generalVolumeMP);
    }
  }
}
