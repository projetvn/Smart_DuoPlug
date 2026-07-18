Bouton[] barDeMenu;
Bouton modeSombre;
int i;
int noir,blanc;
int currentColor;
int[] boutonActif;

void setup(){
  size(1800,1000);
  boutonActif=new int[2];
  boutonActif[0]=0;
  boutonActif[1]=1;
  noir=0;
  blanc=255;
  currentColor=noir;
  barDeMenu=new Bouton[7];
  modeSombre=new Bouton();
  modeSombre.setPosition(1680,10,20,20);
  
  for(i=0;i<7;i++){
    barDeMenu[i]=new Bouton();
    barDeMenu[i].setPosition(10,130+i*70,290,60);
    barDeMenu[i].setColor(10);
    barDeMenu[i].setColorh(30,36,69);
    barDeMenu[i].setTextColor(blanc);
    barDeMenu[i].setTextxPosition(10);
  }
  barDeMenu[0].setText("  Tableau de bord");
  barDeMenu[1].setText("  Prises");
  barDeMenu[2].setText("  Planning");
  barDeMenu[3].setText("  Minuterie");
  barDeMenu[4].setText("  Consommation");
  barDeMenu[5].setText("  Historique");
  barDeMenu[6].setText("  Parametres");
}

void draw(){
  background(currentColor);
  modeSombre.display();
  if(currentColor==blanc){
    modeSombre.setColorh(255,255,255);
    modeSombreIcon(noir);
    fill(250);
  }
  else{
    modeSombre.setColorh(0,0,0);
    modeSombreIcon(blanc);
    fill(10);
  }
  rect(10,0,300,height);
  changeColorOn();
  for(i=0;i<7;i++){
    barDeMenu[i].display();
  }
}

void mousePressed(){
  if(modeSombre.clicked()){
    changerTheme();
  }

  for(i=0;i<7;i++){
    if(barDeMenu[i].clicked()){
      boutonActif[1]=boutonActif[0];
      boutonActif[0]=i;
      break;
    }
  }
}

void changeColorOn(){
  for(i=0;i<7;i++){
    if(currentColor==blanc){
      barDeMenu[i].setColor(250);
    }
    else{
      barDeMenu[i].setColor(10);
    }
  }

  if(currentColor==blanc)
    barDeMenu[boutonActif[0]].setColor(98,99,230);
  else
    barDeMenu[boutonActif[0]].setColor(30,36,69);
}

void changerTheme(){
  if(currentColor==noir){
      currentColor=blanc;
      for(i=0;i<7;i++){
        barDeMenu[i].setColorh(98,99,230);
        barDeMenu[i].setColor(250);
        barDeMenu[i].setTextColor(noir);
        modeSombre.setColor(blanc);
      }
    }
    else{
      currentColor=noir;
      for(i=0;i<7;i++){
        barDeMenu[i].setColorh(30,36,69);
        barDeMenu[i].setColor(10);
        barDeMenu[i].setTextColor(blanc);
        modeSombre.setColor(noir);
      }
    }
    delay(200);
}

void modeSombreIcon(int couleur){
  float angle;
  angle=0;
  pushMatrix();
  translate(1690,20);
  strokeWeight(1);
  stroke(couleur);
  ellipse(0,0,10,10);
  while(angle<2*PI){
     pushMatrix();
     rotate(angle);
     strokeWeight(2);
     stroke(200,200,0);
     fill(couleur);
     text(".",7,7);
     popMatrix();
     angle+=PI/4;
  }
  popMatrix();
  noStroke();
  noFill();
}
