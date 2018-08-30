void Buttons () {

  
///////// DC_BUTTONS ///////////////////////////

// BUTTON: DC nach rechts bewegen
  PImage[] DC_Arrow_Right = {loadImage("DC_Arrow_Right.png"), loadImage("DC_Arrow_Right.png"), loadImage("DC_Arrow_Right_Active.png")};

  Button DC_Right = cp5.addButton("Look_Right")
    .setPosition(1250, 475)
    .setSize(30, 90)
    .setImages(DC_Arrow_Right)
    .updateSize();

  DC_Right.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {

        case(ControlP5.ACTION_PRESS): 
        println("start"); 
        last_string = local_string;
        local_string = "l";
        sb.send("Servo_DC_Send", local_string);  
        break;

        case(ControlP5.ACTION_RELEASE): 
        println("stop"); 
        last_string = local_string;
        local_string = "z";
        sb.send("Servo_DC_Send", local_string);

        println( "Stopp DC");
        break;
      }
    }
  }
  );


// BUTTON: DC nach links bewegen
  PImage[] DC_Arrow_Left = {loadImage("DC_Arrow_Left.png"), loadImage("DC_Arrow_Left.png"), loadImage("DC_Arrow_Left_Active.png")};

  Button DC_Left = cp5.addButton("Look_Left")
    .setPosition(330, 475)
    .setSize(30, 90)
    .setImages(DC_Arrow_Left)
    .updateSize();


  DC_Left.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {

        case(ControlP5.ACTION_PRESS): 
        println("start"); 
        last_string = local_string;
        local_string = "j";
        sb.send("Servo_DC_Send", local_string);  
        break;

        case(ControlP5.ACTION_RELEASE): 
        println("stop"); 
        last_string = local_string;
        local_string = "z";
        sb.send("Servo_DC_Send", local_string);

        println( "Stopp DC");
        break;
      }
    }
  }
  );
  
  
  
  ///////// SERVO_BUTTONS ///////////////////////////
  
  // BUTTON: Servo nach oben bewegen
  PImage[] Servo_Arrow_Up = {loadImage("Servo_Arrow_Up.png"), loadImage("Servo_Arrow_Up.png"), loadImage("Servo_Arrow_Up_Active.png")};

  Button Servo_Up = cp5.addButton("Look_Up")
    .setPosition(760, 230)
    .setSize(90, 30)
    .setImages(Servo_Arrow_Up)
    .updateSize();

  Servo_Up.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {

        case(ControlP5.ACTION_PRESS): 
        println("start"); 
        last_string = local_string;
        local_string = "i";
        sb.send("Servo_DC_Send", local_string);  
        break;

        case(ControlP5.ACTION_RELEASE): 
        println("stop"); 
        last_string = local_string;
        local_string = "z";
        sb.send("Servo_DC_Send", local_string);

        println( "Stopp Servo");
        break;
      }
    }
  }
  );


// BUTTON: Servo nach unten bewegen
  PImage[] Servo_Arrow_Down = {loadImage("Servo_Arrow_Down.png"), loadImage("Servo_Arrow_Down.png"), loadImage("Servo_Arrow_Down_Active.png")};

  Button Servo_Down = cp5.addButton("Look_Down")
    .setPosition(760, 790)
    .setSize(90, 30)
    .setImages(Servo_Arrow_Down)
    .updateSize();


  Servo_Down.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {

        case(ControlP5.ACTION_PRESS): 
        println("start"); 
        last_string = local_string;
        local_string = "k";
        sb.send("Servo_DC_Send", local_string);  
        break;

        case(ControlP5.ACTION_RELEASE): 
        println("stop"); 
        last_string = local_string;
        local_string = "z";
        sb.send("Servo_Send", local_string);

        println( "Servo_DC_Send");
        break;
      }
    }
  }
  );
  
 


}