class PinBox{
  int x,y;
  int tailleW=70;
  int tailleH=80;
  String valeur="";
  boolean actif=false;
  
  PinBox(int x, int y){
    this.x=x;
    this.y=y;
  }
  
  void afficher(){
    if(actif)
      stroke(127,119,221);
    else
      stroke(42,42,56);
      
    strokeWeight(2);
    fill(22,22,31);

    rectMode(CENTER);
    rect(x,y,tailleW,tailleH,15);

    if(valeur.length()>0){
      fill(255);
      textAlign(CENTER,CENTER);
      textSize(35);
      text("●",x,y);
    }
  }

  void cliquer(){
    if(mouseX>x-tailleW/2 && mouseX<x+tailleW/2 && mouseY>y-tailleH/2 && mouseY<y+tailleH/2){
        actif=true;
    }
    else{
        actif=false;
    }
  }

  void ajouterChiffre(char c){
    if(actif && Character.isDigit(c) && valeur.length()==0){
      valeur+=c;
    }
  }


  void supprimer(){
    if(actif){
      valeur="";
    }
  }
  
  String getValeur(){
    return valeur;
  }

}
