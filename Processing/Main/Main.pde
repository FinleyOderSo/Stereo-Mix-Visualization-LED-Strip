import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;
import processing.serial.*;
import controlP5.*;
import javax.swing.*;
import java.util.*;

Minim minim;
FFT fft;
AudioInput in;
Serial Arduino;
ControlP5 cp5;

ColorPicker cp;
ColorPicker cpo;

CheckBox checkbox;
  
int r;
int g;
int b;
  
int freqWidth = 2;
int strength = 7;
int volume = 10;
float generalVolumeMP = 0.6;

float specLow = 0.03; // 3%
float specMid = 0.12;  // 12%
float specHi = 0.2;   // 20%

float scoreLow = 0;
float scoreMid = 0;
float scoreHi = 0;

float scoreLowOld = 0;
float scoreMidOld = 0;
float scoreHiOld = 0;

int timing = 0;
int decreaseRate = 25;

PFont pfontSmall;
PFont pfontNormal;
PFont pfontLarge;
PFont pfontcp5;

boolean SMD;
boolean DF;

float coloration[] = {1,0,0,0,0,0,0,0,1};

void setup()
{

  String portName = Serial.list()[0];
  Arduino = new Serial(this, portName, 1000000);

  minim = new Minim(this);

  in = minim.getLineIn(Minim.STEREO, 2048); 
  fft = new FFT(in.bufferSize(), in.sampleRate());

  pfontSmall = createFont("font/Bearskin DEMO.otf",20,true);
  pfontNormal = createFont("font/Bearskin DEMO.otf",25,true);
  pfontLarge = createFont("font/Bearskin DEMO.otf",30,true);
  pfontcp5 = createFont("Arial",20,true);
  ControlFont font = new ControlFont(pfontcp5,20);

  size(800, 400);
  
  cp5 = new ControlP5( this );
            
  cp = cp5.addColorPicker("color")
          .setPosition(width - 285, height - 150)
          .setColorValue(color(255, 150, 0, 255))
          ;
          
  cpo = cp5.addColorPicker("colorOld")
          .setPosition(width - 285, height - 70)
          .setColorValue(color(255, 150, 0, 255))
          ;

  
  
  cp5.addToggle("toggleSMD")
     .setLabel("")
     .setPosition(width - 255,40)
     .setSize(200,30)
     ;
     
  cp5.addToggle("toggleDF")
     .setLabel("")
     .setPosition(width - 255,105)
     .setSize(200,30)
     ;
  
  cp5.addSlider("decreaseRate")
     .setFont(font)
     .setLabel("")
     .setPosition(width - 255, height - 230)
     .setSize(200,25)
     .setRange(10,40)
     ;
     
     checkbox = cp5.addCheckBox("checkBox")
                .setPosition(120, 70)
                .setSize(40, 40)
                .setItemsPerRow(3)
                .setSpacingColumn(50)
                .setSpacingRow(15)
                .addItem("a1", 1)
                .addItem("a2", 2)
                .addItem("a3", 3)
                .addItem("b1", 4)
                .addItem("b2", 5)
                .addItem("b3", 6)
                .addItem("c1", 7)
                .addItem("c2", 8)
                .addItem("c3", 9)
                .activate(0)
                .activate(8)
                ;
                
}

void draw()
{  
  noStroke();
  background(255);

  fft.forward(in.mix); 

  scoreLow = 0;
  scoreMid = 0;
  scoreHi = 0;

  for (int i = 0; i < fft.specSize()*specLow; i++)
  {
    scoreLow += fft.getBand(i);
  }

  if (scoreLow > scoreLowOld) {
    scoreLowOld = scoreLow;
  }else if (scoreLow < scoreLowOld - 50) {
    scoreLowOld -= (int)(decreaseRate);
  } else if (scoreLow < scoreLowOld - 45) {
    scoreLowOld -= (int)(decreaseRate - 1);
  } else if (scoreLow < scoreLowOld - 40) {
    scoreLowOld -= (int)(decreaseRate - 2);
  } else if (scoreLow < scoreLowOld - 35) {
    scoreLowOld -= (int)(decreaseRate - 3);
  } else if (scoreLow < scoreLowOld - 30) {
    scoreLowOld -= (int)(decreaseRate - 4);
  } else if (scoreLow < scoreLowOld - 25) {
    scoreLowOld -= (int)(decreaseRate - 5);
  } else if (scoreLow < scoreLowOld - 20) {
    scoreLowOld -= (int)(decreaseRate - 6);
  } else if (scoreLow < scoreLowOld - 15) {
    scoreLowOld -= (int)(decreaseRate - 7);
  } else if (scoreLow < scoreLowOld - 10) {
    scoreLowOld -= (int)(decreaseRate - 8);
  }

  for (int i = (int)(fft.specSize()*specLow); i < fft.specSize()*specMid; i++)
  {
    scoreMid += fft.getBand(i);
  }

  if (scoreMid > scoreMidOld) {
    scoreMidOld = scoreMid;
  }else if (scoreMid < scoreMidOld - 50) {
    scoreMidOld -= (int)(decreaseRate);
  } else if (scoreMid < scoreMidOld - 45) {
    scoreMidOld -= (int)(decreaseRate - 1);
  } else if (scoreMid < scoreMidOld - 40) {
    scoreMidOld -= (int)(decreaseRate - 2);
  } else if (scoreMid < scoreMidOld - 35) {
    scoreMidOld -= (int)(decreaseRate - 3);
  } else if (scoreMid < scoreMidOld - 30) {
    scoreMidOld -= (int)(decreaseRate - 4);
  } else if (scoreMid < scoreMidOld - 25) {
    scoreMidOld -= (int)(decreaseRate - 5);
  } else if (scoreMid < scoreMidOld - 20) {
    scoreMidOld -= (int)(decreaseRate - 6);
  } else if (scoreMid < scoreMidOld - 15) {
    scoreMidOld -= (int)(decreaseRate - 7);
  } else if (scoreMid < scoreMidOld - 10) {
    scoreMidOld -= (int)(decreaseRate - 8);
  }

  for (int i = (int)(fft.specSize()*specMid); i < fft.specSize()*specHi; i++)
  {
    scoreHi += fft.getBand(i);
  }

  if (scoreHi > scoreHiOld) {
    scoreHiOld = scoreHi;
  }else if (scoreHi < scoreHiOld - 50) {
    scoreHiOld -= (int)(decreaseRate);
  } else if (scoreHi < scoreHiOld - 45) {
    scoreHiOld -= (int)(decreaseRate - 1);
  } else if (scoreHi < scoreHiOld - 40) {
    scoreHiOld -= (int)(decreaseRate - 2);
  } else if (scoreHi < scoreHiOld - 35) {
    scoreHiOld -= (int)(decreaseRate - 3);
  } else if (scoreHi < scoreHiOld - 30) {
    scoreHiOld -= (int)(decreaseRate - 4);
  } else if (scoreHi < scoreHiOld - 25) {
    scoreHiOld -= (int)(decreaseRate - 5);
  } else if (scoreHi < scoreHiOld - 20) {
    scoreHiOld -= (int)(decreaseRate - 6);
  } else if (scoreHi < scoreHiOld - 15) {
    scoreHiOld -= (int)(decreaseRate - 7);
  } else if (scoreHi < scoreHiOld - 10) {
    scoreHiOld -= (int)(decreaseRate - 8);
  }

  cp.setColorValue(color(scoreLow/10, scoreMid/10, scoreHi/10, (scoreLow/10 + scoreMid/10 + scoreHi/10) / 3));
  cpo.setColorValue(color(scoreLowOld/10, scoreMidOld/10, scoreHiOld/10, (scoreLowOld/10 + scoreMidOld/10 + scoreHiOld/10) / 3));

  Draw();

  if(coloration[0] == 1 && coloration[1] == 1 && coloration[2] == 1){
    r = int((scoreLowOld / 10 + scoreMidOld / 10 + scoreHiOld / 10) / 3);
  }else if(coloration[0] == 1 && coloration[1] == 1 && coloration[2] == 0){
    r = int((scoreLowOld / 10 + scoreMidOld / 10) / 2);
  }else if(coloration[0] == 0 && coloration[1] == 1 && coloration[2] == 1){
    r = int((scoreMidOld / 10 + scoreHiOld / 10) / 2);
  }else if(coloration[0] == 1 && coloration[1] == 0 && coloration[2] == 1){
    r = int((scoreLowOld / 10 + scoreHiOld / 10) / 2);
  }else if(coloration[0] == 1 && coloration[1] == 0 && coloration[2] == 0){
    r = int(scoreLowOld / 10);
  }else if(coloration[0] == 0 && coloration[1] == 1 && coloration[2] == 0){
    r = int(scoreMidOld / 10);
  }else if(coloration[0] == 0 && coloration[1] == 0 && coloration[2] == 1){
    r = int(scoreHiOld / 10);
  }else{
    r = 0;
  }
  
  if(coloration[3] == 1 && coloration[4] == 1 && coloration[5] == 1){
    g = int((scoreLowOld / 10 + scoreMidOld / 10 + scoreHiOld / 10) / 3);
  }else if(coloration[3] == 1 && coloration[4] == 1 && coloration[5] == 0){
    g = int((scoreLowOld / 10 + scoreMidOld / 10) / 2);
  }else if(coloration[3] == 0 && coloration[4] == 1 && coloration[5] == 1){
    g = int((scoreMidOld / 10 + scoreHiOld / 10) / 2);
  }else if(coloration[3] == 1 && coloration[4] == 0 && coloration[5] == 1){
    g = int((scoreLowOld / 10 + scoreHiOld / 10) / 2);
  }else if(coloration[3] == 1 && coloration[4] == 0 && coloration[5] == 0){
    g = int(scoreLowOld / 10);
  }else if(coloration[3] == 0 && coloration[4] == 1 && coloration[5] == 0){
    g = int(scoreMidOld / 10);
  }else if(coloration[3] == 0 && coloration[4] == 0 && coloration[5] == 1){
    g = int(scoreHiOld / 10);
  }else{
    g = 0;
  }
  
  if(coloration[6] == 1 && coloration[7] == 1 && coloration[8] == 1){
    b = int((scoreLowOld / 10 + scoreMidOld / 10 + scoreHiOld / 10) / 3);
  }else if(coloration[6] == 1 && coloration[7] == 1 && coloration[8] == 0){
    b = int((scoreLowOld / 10 + scoreMidOld / 10) / 2);
  }else if(coloration[6] == 0 && coloration[7] == 1 && coloration[8] == 1){
    b = int((scoreMidOld / 10 + scoreHiOld / 10) / 2);
  }else if(coloration[6] == 1 && coloration[7] == 0 && coloration[8] == 1){
    b = int((scoreLowOld / 10 + scoreHiOld / 10) / 2);
  }else if(coloration[6] == 1 && coloration[7] == 0 && coloration[8] == 0){
    b = int(scoreLowOld / 10);
  }else if(coloration[6] == 0 && coloration[7] == 1 && coloration[8] == 0){
    b = int(scoreMidOld / 10);
  }else if(coloration[6] == 0 && coloration[7] == 0 && coloration[8] == 1){
    b = int(scoreHiOld / 10);
  }else{
    b = 0;
  }

  if(SMD == true){
    arduino();
  }

}
