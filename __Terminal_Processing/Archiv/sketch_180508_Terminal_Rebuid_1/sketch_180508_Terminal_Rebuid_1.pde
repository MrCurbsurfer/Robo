import spacebrew.*;
String server="sandbox.spacebrew.cc";
String name="TERMINAL";
String description ="Client that sends";

// Keep track of our current place in the range
String local_string = "";
String remote_string = "";
String last_string = "";



Spacebrew sb;


void setup() {
  size(1680, 1050);



  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // Dieser Publisher gibt die Strings aus, die zur Steuerung des Fahrzeugs benötigt werden
  sb.addPublish( "DriveStrings", "string" ); 

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
  
  // Ausgabe der Mauswerte in der Anzeige
  text( "X " + mouseX, 100, 900 );
  text( "Y " + mouseY, 100, 920 );
  popMatrix();



  // FAHWERK STEUERUNG __________________________________

  fill(0);
  // draw lines
  line(0, 35, width - 60, 35);
  line(30, 95, width, 95);


  // draw message being typed
  text("Type Message: ", 30, 60);  
  text(local_string, 150, 60);  

  // draw message that was just sent
  text("Message Sent: ", 30, 80);  
  text(last_string, 150, 80);  

  // draw latest received message
  text("Message Received: ", 30, 120);  
  text(remote_string, 150, 120);

  //Laut Spacebrew sind nur 50 Zeichen möglich!



  // Diese Textboxen werden erst wieder benötigt, wenn der Textswitch eingefügt wurde
  // draw message being typed
 /* text("Type Message: ", 30, 900);  
  text(local_string, 150, 900);  

  text("Message Sent: ", 30, 920);  
  text(last_string, 150, 920);  

  // draw latest received message
  text("Message Received: ", 30, 940);  
  text(remote_string, 150, 940);
  
  */
}