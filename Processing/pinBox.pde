public class PinBox{
  private int x,y;
  private int tailleW=70;
  private int tailleH=80;
  private String valeur="";
  private boolean actif=false;
  
  public PinBox(int x, int y){
    this.x=x;
    this.y=y;
  }
  
  public void afficher(){
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
      textAlign(CENTER,UP);
      textSize(100);
      text(".",x,y);
    }
  }

  public void cliquer(){
    if(mouseX>x-tailleW/2 && mouseX<x+tailleW/2 && mouseY>y-tailleH/2 && mouseY<y+tailleH/2){
        actif=true;
    }
    else{
        actif=false;
    }
  }

  public void ajouterChiffre(char c){
    if(actif && Character.isDigit(c) && valeur.length()==0){
      valeur+=c;
    }
  }

  public void supprimer(){
    if(actif){
      valeur="";
    }
  }
  
  public String getValeur(){
    return valeur;
  }
}
