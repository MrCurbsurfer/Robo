void keyPressed() {



  //_____Autopilot_ON/OFF______________________

  //Autopilot OFF
  if (key == '+') {

    OrionPort.write('+');
    Auto = false;
  }

  //Autopilot ON
  if (key == '#') {

    OrionPort.write('#');
    Auto = true;
  }

  if (Auto == false) {
    //Forward_run();
    if ( key == 'w')
    {
      OrionPort.write('w');
      println(key);
    }

    //Backward_run()
    if (key == 's')
    {
      OrionPort.write('s');
      println(key);
    }

    //TurnLeft_run()
    if (key == 'a')
    {
      OrionPort.write('a');
      println(key);
    }

    //TurnRight_run()
    if (key == 'd')
    {
      OrionPort.write('d');
      println(key);
    }

    //
    if (key == 'r')
    {
      OrionPort.write('r');
      println(key);
    }

    //
    if (key == 'f')
    {
      OrionPort.write('f');
      println(key);
    }





    //_____Chars_for_Arduino________________

    //Turn_Left
    if (key == 'k')
    {
      //ArduinoPort.write('k');
      //println(key);
    }
    // Turn_Right
    if (key == 'l')
    {
      //ArduinoPort.write('l');
      //println(key + " Arduino");
    }
  }

  if (Auto == true) {

    key = '#';
  }
}

void keyReleased() {

  if (Auto == false) {
    key = 'q';
    OrionPort.write('q');
    println(key);
  }

  if (Auto == true) {
    key = '#';
  }
}
