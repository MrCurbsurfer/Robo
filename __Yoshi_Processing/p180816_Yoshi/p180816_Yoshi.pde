
import processing.serial.*;
import spacebrew.*;
import guru.ttslib.*;



//TTS tts;
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
int mx;
int my;

float xMouse_Left;
float xMouse_Right;
float yMouse;
float easing = 0.1;

/*String local_string_mouse = "";
 String remote_string_mouse = "";
 String last_string_mouse = "";*/

Spacebrew sb;



void setup() {
  size(1024, 600);
  smooth();



  //instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  //declare your subscribers
  sb.addSubscribe( "Receive", "string" );
  sb.addSubscribe ( "Servo_ReceiveX", "string");
  sb.addSubscribe ( "Servo_ReceiveY", "string");

  //connect to server!
  sb.connect(server, name, description );

  printArray(Serial.list());


  // Zuordnung eines Ports aus der Liste zum Serial class Objekt

  //String OrionPortName = Serial.list()[1];
  String ArduinoPortName = Serial.list()[1];

  // Initiieren der Ports

  //OrionPort = new Serial(this, OrionPortName, 9600);
  ArduinoPort = new Serial(this, ArduinoPortName, 9600);


  // tts = new TTS();

  Auto = false;
}

void draw() {



  background(0);

  //Hier wird das Easing erledigt
  // Jedes Auge benötigt einen eigenen X-Wert, deshalb müssen 2 Werte ge-east werden
  float targetX_Left = mx - 200;
  float dx_Left = targetX_Left - xMouse_Left;
  xMouse_Left += dx_Left * easing;

  float targetX_Right = mx + 200;
  float dx_Right = targetX_Right - xMouse_Right;
  xMouse_Right += dx_Right * easing;

  float targetY = my;
  float dy = targetY - yMouse;
  yMouse += dy * easing;

  
  // Die bereits ge-easten Werte werden auf die Abmessungen des Displays begrenzt
  // Zur unteren Grenze wird der Radius der Ellipse addiert, von der oberen Grenze subtrahiert
  float c_xMouse_Left = constrain(xMouse_Left, 25, 999);
  float c_xMouse_Right = constrain(xMouse_Right, 25, 999);
  
   
  float c_yMouse = constrain(yMouse, 25, 575);
  

  ellipse (c_xMouse_Left, c_yMouse, 50, 50);
  ellipse (c_xMouse_Right,c_yMouse, 50, 50);




  line(30, 35, width - 60, 35);
  line(30, 115, width-60, 115);


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