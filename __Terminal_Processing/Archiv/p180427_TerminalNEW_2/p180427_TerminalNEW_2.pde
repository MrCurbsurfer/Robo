
 /* String Example
 *
 * 	 Send messages up to 50 chars long. Receive string messages
 *   from other spacebrew clients as well.
 * 
 */

import spacebrew.*;
String server="sandbox.spacebrew.cc";
String name="Terminal";
String description ="Client that sends";


Spacebrew sb;

// Keep track of our current place in the range
String local_string = "";
String remote_string = "";
String last_string = "";




int mapX; // ServoVariable
boolean Autopilot;
boolean textswitch; // Variable, die zwischen der Eingabe von Steurungs-Strings und der Eingabe von Text-Strings umschaltet



void setup() {
  size(1680, 1050);



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




  background(255);

  pushMatrix();
  translate(0, 50);


  fill(0, 200, 0);
  noStroke();
  rect(0, 800, 1680, 30);


  fill(0, 200, 0, 99);
  rect(0, 830, 1680, 580);

  fill(255);
  rect(130, 830, 1680, 200);

  fill(0);
  text( "X " +mouseX, 100, 900 );
  text( "Y " +mouseY, 100, 920 );
  popMatrix();


  /*
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
   println(mapY + " MapY");
   
   //Sliderbox X
   
   fill(0,0,0,50);
   noStroke();
   rect(0, 510, width, 40);
   
   stroke(0);
   line(0,530,720,530);
   
   fill(255, 0, 0);
   stroke(200, 0, 0);
   ellipse (mapX, 530, 10,10);
   
   
   */






  // FAHWERK STEUERUNG __________________________________

  fill(0);
  // draw lines
  line(0, 35, width - 60, 35);
  line(30, 95, width, 95);

  if (textswitch == false) {

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
  //Laut Spacebrew sind nur 50 Zeichen möglich!


  if (textswitch == true) {

    // draw message being typed
    text("Type Message: ", 30, 900);  
    text(local_string, 150, 900);  

    text("Message Sent: ", 30, 920);  
    text(last_string, 150, 920);  

    // draw latest received message
    text("Message Received: ", 30, 940);  
    text(remote_string, 150, 940);
  }
}