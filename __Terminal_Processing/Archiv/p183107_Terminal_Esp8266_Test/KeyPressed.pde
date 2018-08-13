void keyPressed() {

if (key == 'f'){

byte[] message = new byte[2];
message[0] = 0;
message[1] = 2;
udp.send(message, ip , port);

println("Pressed f" );
}



if (key == 'r'){

byte[] message = new byte[2];
message[0] = 0;
message[1] = 3;
udp.send(message, ip , port);

println("Pressed r" );
}


if (key == 'k'){

byte[] message = new byte[2];
message[0] = 0;
message[1] = 4;
udp.send(message, ip , port);

println("Pressed k" );
}



if (key == 'l'){

byte[] message = new byte[2];
message[0] = 0;
message[1] = 5;
udp.send(message, ip , port);

println("Pressed l" );
}




}


void keyReleased(){
  
byte[] message = new byte[2];
message[0] = 0;
message[1] = 0;
udp.send(message, ip , port);

println("Key Released" );
}