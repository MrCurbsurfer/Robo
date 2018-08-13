/*
 * String Example
 *
 * 	 Send messages up to 50 chars long. Receive string messages
 *   from other spacebrew clients as well.
 * 
 */

import spacebrew.*;
String server="sandbox.spacebrew.cc";
String name="String_Publisher";
String description ="Client that sends";


Spacebrew sb;

// Keep track of our current place in the range
String local_string = "";
String remote_string = "";
String last_string = "";




int mapX; // ServoVariable
boolean Auto = false;
boolean Remote = true;



void setup() {
  size(720, 590);
 

  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // declare your publishers
  sb.addPublish( "DriveSend", "string" ); 
  
  //sb.addPublish( "ServoSendX", "range");
  
  //sb.addPublish( "ServoSendY", "range");


  // connect!
  sb.connect(server, name, description );
}

void draw() {
  
  
  
  background(200, 0, 0);



// SERVO-STEUERUNG __________________________________

  // Mauspad
  rect(360,150,360,360);
  fill(0);
  
  // die Mauswerte auf das Mauspad begrenzen);
  int mx = constrain(mouseX, 360, 720);
  int my = constrain(mouseY, 150, 510);
  
  // Die Werte der Maus auf Wert zwischen 150 und 600 mappen
  // 150 - 600 sind SERVOMIN - SERVOMAX PWM im dazugehörigen Arduinoskript (ggf. anpassen!)
  float fmapX = map (mx, 360,720,150,600);
  float fmapY = map (my, 150,510,150,600);
  
  // Dezimalstellen von float wegkürzen
  int mapX = round(fmapX);
  int mapY = round(fmapY);
  
  // Zeichnen des Cursors;
  fill(255,0,0);
  noStroke();
  rect(mx,my, 5,5);
  
  /*println(mouseX + " MouseX");
  println(mouseY + " MouseY");
  println(mx + " MX");
  println(mapX + " MapX");
  println(mapY + " MapY");*/
  
  //Sliderbox X
  
  fill(0,0,0,50);
  noStroke();
  rect(0, 510, width, 40);
  
  stroke(0);
  line(0,530,720,530);
  
  fill(255, 0, 0);
  stroke(200, 0, 0);
  ellipse (mapX, 530, 10,10);
  
  

  
  
  
  
  // FAHWERK STEUERUNG __________________________________
  
  fill(255);
  // draw lines
  line(0, 35, width - 60, 35);
  line(30, 95, width, 95);
  
 
  // draw instruction text
  text("Type messages up to 50 chars long and hit return to send so Spacebrew. ", 30, 20);  

  // draw message being typed
  text("Type Message: ", 30, 60);  
  text(local_string, 150, 60);  

  // draw message that was just sent
  text("Message Sent: ", 30, 80);  
  text(last_string, 150, 80);  

  // draw latest received message
  text("Message Received: ", 30, 120);  
  text(remote_string, 150, 120);
  
 
}