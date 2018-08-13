void onStringMessage( String name, String value ) {

  println("got string message " + name + " : " + value);
  remote_string = value;

  if(remote_string.length() > 2) {
    tts.speak(remote_string);}


  // trim(value) kürzt überflüssige Zeichen weg (z.B Leerzeichen);
  value = trim(value);


  // value.charAt(0) bestimmt, dass vom String 'value' der char an Position 0 ( also der 1. Buchstabe)
  // übernommen wird
  char remote = value.charAt(0);



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


    //_____Chars_for_Arduino_DC_Motor_(Head)_______________

    //Turn_Left
    if (remote == 'k')
    {
      ArduinoPort.write('k');
      println(remote);
    }

    //Turn_Right
    if (remote == 'l')
    {
      ArduinoPort.write('l');
      println(remote + " Arduino");
    }
  }

  if (Auto == true) {

    OrionPort.write('#');
    println( "Autopilot");
    mode = "AUTOPILOT";
  }
}