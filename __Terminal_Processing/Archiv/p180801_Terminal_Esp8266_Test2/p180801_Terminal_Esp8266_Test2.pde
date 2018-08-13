// eduzal / koogy
import http.requests.*;
 
String baseURL="http://"+"api.olhovivo.sptrans.com.br/v0";
String token="2bc28344ead24b3b5fe273ec7389d2e4d14abd2bad45abe6d8d774026193f894";
String route="7272";
String cookie;
String toggleRed = "192.168.0.244/toggleRed";

 
void setup() {
  size(1000, 800);
 
  //API Olho Vivo
  authentication();
  getLinha(route);
}
 
void authentication() {
  println("POST ==================");
  String reqURL = "/Login/Autenticar?token=";
  PostRequest post = new PostRequest(baseURL + reqURL + token);
  post.send();
  
  PostRequest post2 = new PostRequest(toggleRed);
  post2.send();
  println("Reponse Content: " + post.getContent());
  println("Reponse Content-Length Header: " + post.getHeader("Content-Length"));
  cookie = post.getHeader("set-cookie");
  println("Cookie: " + cookie);
}
 
void getLinha(String busLIne) {
  println("GET ===================");
  String reqURL = "/Posicao?codigoLinha=";
  GetRequest get = new GetRequest(baseURL + reqURL + route); 
  get.addHeader("Cookie", cookie);
  get.send();
  println("Reponse Content: " + get.getContent());
  println("Reponse Content-Length Header: " + get.getHeader("Content-Length"));
}