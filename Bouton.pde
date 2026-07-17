class Bouton{
  float x,y;
  float w,h;
  String text;
  int R,G,B,Rh,Gh,Bh;
  Bouton(){}
  void setPosition(float x,float y,float w,float h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  void setText(String text){
    this.text=text;
  }
  void setColor(int R,int G,int B){
    this.R=R;
    this.G=G;
    this.B=B;
    if(R*5>255){
      Rh=255;
    }
    else{
      Rh=R*5;
    }
    if(G*5>255){
      Gh=255;
    }
    else{
      Gh=G*5;
    }
    if(B*5>255){
      Bh=255;
    }
    else{
      Bh=B*5;
    }
  }
  boolean hover(){ //souris en dessus
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
      return true;
    }
    return false;
  }
  void display(){
    if(hover()){
     fill(Rh,Gh,Bh);
    }
    else{
      fill(R,G,B);
    }
    rect(x,y,w,h,15);
    fill(255);
    textSize(20);
    text(text,x,y+h/2);
  }
  boolean clicked(){
    if(mousePressed && hover()){
      return true;
    }
    return false;
  }
}
