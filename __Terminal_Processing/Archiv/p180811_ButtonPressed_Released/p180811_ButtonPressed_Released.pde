// versions used : processing 2.0b7, controlP5 2.0.4

import controlP5.*;

ControlP5 cp5;

void setup() {
  size(400,400);
  
  cp5 = new ControlP5(this);
  
  Button b1 = cp5.addButton("click").setPosition(100,100).setSize(100,40);
  
  b1.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.ACTION_PRESSED): println("start"); break;
        case(ControlP5.ACTION_RELEASED): println("stop"); break;
      }
    }
  }
  );

}

void draw() {
}