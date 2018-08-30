
/* String Example
 *
 * 	 Send messages up to 50 chars long. Receive string messages
 *   from other spacebrew clients as well.
 * 
 */

import controlP5.*;
import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="String_Publisher";
String description ="Client that sends";


Spacebrew sb;
ControlP5 cp5;

// Keep track of our current place in the range
String local_string = "";
String remote_string = "";
String last_string = "";



int fontColor = 255;
//int mapX; // ServoVariable
boolean Auto = false;
boolean Remote = true;
boolean textswitch; // Variable, die zwischen der Eingabe von Steurungs-Strings und der Eingabe von Text-Strings umschaltet

// AUGEN

String EyeString;
//String mx;
//String my;
float xMouse;
float yMouse;



void setup() {


  size(1680, 1050);
  background(#606060);
  smooth();






  ///////// INITIALISIERUNGEN ///////////////////////////

  sb = new Spacebrew( this ); //SPACEBREW
  cp5 = new ControlP5(this);  //BUTTONS




  // declare your publishers
  sb.addPublish( "DriveSend", "string" ); 
  sb.addPublish( "TextSend", "string" );
  sb.addPublish( "Servo_DC_Send", "string" );
  sb.addPublish( "Eyes_Send", "string" );


  // connect!
  sb.connect(server, name, description );





  ///////// BUTTONS ///////////////////////////
  // Hier wird void Buttons () aufgerufen - siehe Tab Buttons

  Buttons();
  cp5 = new ControlP5(this);
}

void draw() {

  background(#606060);



  // AUGEN start
  //------------------------------------------

  // Permanentes Ausgeben der X/Y Mauswerte neben dem Cursor
  text( "X " + mouseX, mouseX + 50, mouseY );
  text( "Y "+ mouseY, mouseX + 50, mouseY + 20 );



  // mouseX und mouseY werden in eine Variable gepackt. Ohne diesen Schritt kann 
  // die constrain Funktion nicht verwendet werden


  int eyesX = mouseX;
  int eyesY = mouseY;


  eyesX = constrain(eyesX, 555, 1125);
  eyesY = constrain(eyesY, 250, 800);

  fill(255, 0, 0, 50);
  ellipse (eyesX-200, eyesY, 50, 50);
  ellipse (eyesX+200, eyesY, 50, 50);

  if ( mouseX - pmouseX > 1 || mouseY - pmouseY > 1) {


    // Hier wird ein Array mit dem Namen "eyesXY" erstellt um die Werte von
    // eyesX und eyesY zu speichern
    int[] eyesXY = new int[2]; 
    eyesXY[0] = eyesX; 
    eyesXY[1] = eyesY; 


    // Die Integer-Werte werden im String "EyeString" zusammengefasst
    String EyeString = join(nf(eyesXY, 0), ","); 
    println(EyeString);   

    last_string = local_string;
    local_string = EyeString;
    sb.send("Eyes_Send", local_string);
  }
  //------------------------------------------
  // AUGEN ende

  

  noFill();
  stroke(255);
  strokeWeight(1);
  rectMode(CENTER);
  rect(840, 525, 1024, 600);


  rectMode(CORNER);

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

  popMatrix();





  // FAHWERK STEUERUNG __________________________________

  fill(fontColor);
  // draw lines
  line(0, 35, width - 60, 35);
  line(30, 95, width, 95);

  if (textswitch == false) {

    // draw message being typed
    text("Drive Command: ", 30, 100);  
    text(local_string, 200, 100);  

    // draw message that was just sent
    text("Drive Command Sent: ", 30, 120);  
    text(last_string, 200, 120);  

    // draw latest received message
    text("Drive Command Received: ", 30, 160);  
    text(remote_string, 200, 160);

    text("DRIVE MODE", 30, 50);
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

    text("TYPE MODE", 30, 50);
  }
}