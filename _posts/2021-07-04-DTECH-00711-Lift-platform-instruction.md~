---
title:  "DTECH-00711 Lift platform instruction"
mathjax: true
author: Eleven Chen
category: AMLSH
---
## Warning
Please read this instruction carefully, failure to follow below steps may result in motor damage or short circuit.

## Usage
1. The system is comprised of a control pannel, a DC power source and a sliding rail. Before connecting the control pannel and the DC power source to the 220v~AC, **make sure that the switch on the control pannel is switched to the middle position(off)** and the DC power power source is also turned to off position.

2. Connect the control pannel and the DC power source to the Ac. Adjust the potentiometer on the control pannel so that the number on the LCD screen is the position you want the platform to be. 

3. Pull down the switch on the control pannel so that the platform moves to the target position. To go up back to the origin, pull up the switch.

4. If the platform reaches out of the range but still moving, swtich off the DC immdiately. If the motor goes on an undesired direction, switch off the DC first, then push the reset button on arduino.


## Resources
Arduino code v1.2:
'''
/* The code to control the movement of the slider*/
/* The version 1.2 starts the glider from the top**/

// Variables shared in both setup and loop
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27,20,4); // object for lcd control
const double Speed = 0.5;         // The speed of the motor circle/second
const double Bottomlen = 47.7; //cm
const double Gliderlen = 41.8; //cm
const double Maxcircle = 5.5625;
const int Pulse = 6400; // pulse per circle


int lastchoice = 0;
int thischoice = 0;
double circle = 0;
double interval = 400; // interval waiting for user input ms

//setup for the locations of pins
byte pul = 32;
byte dir = 33;
byte loc = A4;
byte upin = 14;
byte downin = 17;

void setup() {
  lcd.init();
  lcd.backlight();
  pinMode(pul,OUTPUT);
  pinMode(dir,OUTPUT);
  // The A4, 14, 17 by default, are the inputs
}

void loop() {
  lastchoice = thischoice;
  lcd.setCursor(0,0);

  // display the current target location from the analog input
  double upperlen = Gliderlen*analogRead(loc)/1024;
  lcd.print("TrgLoc: -");
  lcd.print(upperlen);
  lcd.print("cm");

  // judge the user movement
  if (digitalRead(upin)>digitalRead(downin)){
    thischoice = 1;
  }
  else if (digitalRead(upin)<digitalRead(downin)){
    thischoice = -1;
  }else{
    thischoice = 0;
  }

  if ((lastchoice!=1)&&(thischoice==1)){
    tone(pul,Pulse*Speed,1000*circle/Speed);
    delay(1000*circle/Speed);
  }

  if ((lastchoice!=-1)&&(thischoice==-1)){
    circle = Maxcircle*analogRead(loc)/1024;
    digitalWrite(dir,HIGH);
    tone(pul,Pulse*Speed,1000*circle/Speed);
    delay(1000*circle/Speed);
    digitalWrite(dir,LOW);
  }

  delay(interval);
}

'''
The control pannel uses Arduino Mega which was produced in China, if your computer connot recognize the arduino, you can download the chinese version Mega usb driver at:

http://www.wch.cn/download/CH341SER_EXE.html
