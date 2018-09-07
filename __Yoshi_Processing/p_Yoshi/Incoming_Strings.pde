void onStringMessage( String name, String value ) {

  //println("got string message " + name + " : " + value);
  remote_string = value;



  // trim(value) kürzt überflüssige Zeichen weg (z.B Leerzeichen);
  value = trim(value);


  // value.charAt(0) bestimmt, dass vom String 'value' der char an Position 0 ( also der 1. Buchstabe)
  // übernommen wird
  char remote = value.charAt(0);





  /////////// SUBSCRIBER Eyes_Recieve ///////////////////////////

  // check for name
  // Hier passiert nur etwas, wenn der Subscriber "Eyes_Receive" einen String erhält
  if ( name.equals("Eyes_Receive")) {

    //println("got string message " + name + " : " + value);
    remote_string = value;
    //println(value);

    // Vom Terminal kommt ein String in folgendem Format: (1203,324). Das sind die aktuellen MausX und MausY
    // Werte die bereits in den String "value" gepackt wurden. 
    // Folgende Funktion Teilt diesen String am Komma und verpackt diese in die Integer-Variablen eyesX und eyesY 

    String [] valXY = split(value, ',');

    String valX = valXY[0];
    String valY = valXY[1];

    eyesY = Integer.parseInt(valY); 
    eyesX = Integer.parseInt(valX); 

    //println ("eyesX " + eyesX + ", eyesY" + eyesY);



    //println (eyesY);
  }

  /////////// SUBSCRIBER Servo_Receive ///////////////////////////

  if ( name.equals("Servo_DC_Receive")) {

    //println("got string message " + name + " : " + value);
    remote_string = value;
    //println(value);


    value = trim(value);


    // value.charAt(0) bestimmt, dass vom String 'value' der char an Position 0 ( also der 1. Buchstabe)
    // übernommen wird
    char SDCremote = value.charAt(0);

   
    /////////// Chars for Servo/DC Motor ///////////////////////////

    //Turn_Left
    if (SDCremote == 'j')
    {
      ArduinoPort.write('j');
      println("SDC "+ SDCremote);
    }

    //Turn_Right
    if (SDCremote == 'l')
    {
      ArduinoPort.write('l');
      println("SDC "+ SDCremote);
    }
    
    //Up
    if (SDCremote == 'i')
    {
      ArduinoPort.write('i');
      println("SDC "+ SDCremote);
    }
    
    //Down
    if (SDCremote == 'k')
    {
      ArduinoPort.write('k');
      println("SDC "+ SDCremote);
    }
    
    //Stopp
    if (SDCremote == 'z')
    {
      ArduinoPort.write('z');
      println("SDC "+ SDCremote);
    }
  }


/////////// SUBSCRIBER Text_Receive ///////////////////////////

  // check for name
  // Hier passiert nur etwas, wenn der Subscriber "Text_Receive" einen String erhält
  if ( name.equals("Text_Receive")) {

    //println("got string message " + name + " : " + value);
    remote_string = value;
    //println(value);
    
   if(remote_string.length() > 5) {
   tts.speak(remote_string);}


    

    
  }




  //_____Autopilot_ON/OFF______________________

  //Autopilot OFF
  if (remote == '+') {

    OrionPort.write('+');
    Auto = false;
  }

  //Autopilot ON
  if (remote == '#') {

    OrionPort.write('#');
    Auto = true;
  }



  //_____Chars_for_Orion_DC_Motors_____________

  if (Auto == false) {

    // falls nicht im Autopilot, übernimm für den String mode die vom Terminal
    // kommenden Strings aus remote_string;
    mode = remote_string;

    // Forward_run()
    if ( remote == 'w')
    {
      OrionPort.write('w');
      println(remote);
    }

    //Backward_run()
    if (remote == 's')
    {
      OrionPort.write('s'); 
      println(remote);
    }

    //TurnLeft_run()  
    if (remote == 'a')
    {
      OrionPort.write('a'); 
      println(remote);
    }

    //TurnRight_run()
    if (remote == 'd')
    {
      OrionPort.write('d'); 
      println(remote);
    }

    //
    if (remote == 'r')
    {
      OrionPort.write('r'); 
      println(remote);
    }

    //
    if (remote == 'f')
    {
      OrionPort.write('f'); 
      println(remote);
    }


    //Stop_Run und Stop_DC
    if (remote == 'q')
    {
      OrionPort.write('q');
      println(remote);

      ArduinoPort.write('q');
    }


/*
    /////////// Chars for Servo/DC Motor ///////////////////////////

    //Turn_Left
    if (SDCremote == 'j')
    {
      ArduinoPort.write('j');
      println(remote);
    }

    //Turn_Right
    if (SDCremote == 'l')
    {
      ArduinoPort.write('l');
      println(SDCremote + " Arduino");
    }
    
    //Up
    if (SDCremote == 'i')
    {
      ArduinoPort.write('i');
      println(remote + " Arduino");
    }
    
    //Down
    if (SDCremote == 'k')
    {
      ArduinoPort.write('k');
      println(remote + " Arduino");
    }
    
    //Stopp
    if (SDCremote == 'z')
    {
      ArduinoPort.write('z');
      println(remote + " Arduino");
    }
    
  */
    
  }

  if (Auto == true) {

    OrionPort.write('#');
    println( "Autopilot");
    mode = "AUTOPILOT";
  }
}