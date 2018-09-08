
import processing.serial.*;
import spacebrew.*;
import guru.ttslib.*;



TTS tts;
Serial OrionPort;
Serial ArduinoPort;


boolean Auto = false;
String mode = "Standby"; // Die Variable für Message Received

//_______Spacebrew_Stuff_________________
String server="sandbox.spacebrew.cc";
String name="String_Subscriber";
String description ="Client that reads";

String local_string = "";
String remote_string = "";
String last_string = "";


// Variablen für die Augen
// mx und my kommen vom Terminal als Strings, werden im Tab Incoming_Strings zu 
// Integern konvertiert
int val;

// X und Y Werte für die Augen vor der weiteren Verarbeitung
int eyesX;
int eyesY;

// Finale Werte für die Augen
int EyesX;
int EyesY;
float easing = 0.1;


PImage Eye;



char SDCremote;

Spacebrew sb;



void setup() {

  Eye = loadImage("Eye.png");

  size(1920, 1080);
  smooth();



  //instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  //declare your subscribers
  sb.addSubscribe( "Receive", "string" );
  sb.addSubscribe( "Text_Receive", "string" );
  sb.addSubscribe ( "Eyes_Receive", "string");
  sb.addSubscribe ("Servo_DC_Receive", "string");


  //connect to server!
  sb.connect(server, name, description );

  printArray(Serial.list());


  // Zuordnung eines Ports aus der Liste zum Serial class Objekt

  //String OrionPortName = Serial.list()[1];
  String ArduinoPortName = Serial.list()[0];

  // Initiieren der Ports

  //OrionPort = new Serial(this, OrionPortName, 9600);
  ArduinoPort = new Serial(this, ArduinoPortName, 9600);


  tts = new TTS();

  Auto = false;
}

void draw() {



  background(#313130);

  //Dritter Zahlenwert in der Klammer: Radius des Auges 
  float fmapEyesY = map (eyesY, 250, 800, 75, 1005);
  int mapEyesY = round(fmapEyesY);

  //Dritter Zahlenwert in der Klammer: Radius des Auges + Abstand der Augen vom MausCursor
  float fmapEyesX = map (eyesX, 555, 1125, 425, 1495);
  int mapEyesX = round(fmapEyesX);

  float targetX = mapEyesX;
  float dx = targetX - EyesX;
  EyesX += dx * easing;

  float targetY = mapEyesY;
  float dy = targetY - EyesY;
  EyesY += dy * easing;




  //Augen zeichnen

  //ellipse(EyesX + 350 , EyesY,150,150);
  //ellipse(EyesX - 350 , EyesY,150,150);

  imageMode(CENTER);

  image(Eye, EyesX + 350, EyesY);
  image(Eye, EyesX - 350, EyesY);






  // draw message being typed
  text("Type Message: ", 30, 60);
  text(local_string, 150, 60);

  // draw message that was just sent
  text("Message Sent: ", 30, 80);
  text(last_string, 150, 80);

  // show pressed key if keyboard input
  text("Key Pressed: ", 30, 100);
  text(key, 150, 100);

  // mode wird abhängig von Autopilot ON/OFF im Tab Incoming
  // Strings geändert
  // draw latest received message
  text("Message Received: ", 30, 140);
  text(mode, 150, 140);
}