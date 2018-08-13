import http.requests.*;

public void setup () {

 size(400,400);
 smooth();
 
  PostRequest post = new PostRequest("192.168.0.244/toggleRed");
 
  post.send();
  
}