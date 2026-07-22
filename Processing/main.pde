import processing.serial.*;

Serial port;
Bouton[] barDeMenu;
Bouton modeSombre;
int i;
int noir,blanc;
int currentColor;
int[] boutonActif;
Dashboard d;
String pin; 
String vraipin,test;
int page;
String donnees;
String[] prises;
String[] parse1,parse2;
String[] valeur1,valeur2;

void setup(){
  port=new Serial(this, "/dev/ttyACM0", 9600);
  page=0;
  pin="";
  int i; 
  size(1800,1000);
  d=new Dashboard();
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
  }
  barDeMenu[0].setText("   Tableau de bord");
  barDeMenu[1].setText("   Prises");
  barDeMenu[2].setText("   Planning");
  barDeMenu[3].setText("   Minuterie");
  barDeMenu[4].setText("   Consommation");
  barDeMenu[5].setText("   Historique");
  barDeMenu[6].setText("   Parametres");
  initialiserAuthentification();
}

void draw(){
  if(page==0){
   afficherAuthentification();
   test=port.readStringUntil('\n');
   if(test!=null)
      vraipin=test.replace("\r", "").replace("\n", "");
    }
   
  else if(page==1){
    rectMode(CORNER);
    textAlign(LEFT,BASELINE);
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
    
    if(boutonActif[0]==0){
      d.afficher(currentColor);
      donnees=port.readStringUntil('\n');
      if(donnees!=null){
        prises=split(donnees,' ');
        prises[1]=prises[1].substring(0, prises[1].length()-1);
        parse1=split(prises[0],':');
        parse2=split(prises[1],':');
        valeur1=split(parse1[1],',');
        valeur2=split(parse2[1],',');
      }
      
      if(valeur1[0].equals("1")){
        iconePower(492.25, 715, 120, color(76,255,108), color(76,255,108));
        badgeON(570,522);
      }
      else{
        iconePower(492.25, 715, 120, color(color(65,72,90)), color(color(65,72,90)));
        badgeOFF(570,522);
      }
      
      if(valeur2[0].equals("1")){
        iconePower(816.75,715 , 120, color(76,255,108), color(76,255,108));
        badgeON(894.5,522);
      }
      else{
        iconePower(816.75, 715, 120, color(color(65,72,90)), color(color(65,72,90)));
        badgeOFF(570,522);
      }
      if(currentColor==noir){
        fill(255);
        textSize(40);
        textAlign(LEFT,BASELINE);
        text(int(valeur1[0])+int(valeur2[0]),400,280);
        text(round(float(valeur1[1])+float(valeur2[1]))+" W",764.5,280);
        textSize(20);
        textAlign(CENTER);
        text("Puissance : "+valeur1[1]+" W",492.25,910);
        text("Puissance : "+valeur2[1]+" W",816.75,910);
      }
      else{
        fill(0);
        textSize(40);
        textAlign(LEFT,BASELINE);
        text(int(valeur1[0])+int(valeur2[0]),400,280);
        text(round(float(valeur1[1])+float(valeur2[1]))+" W",764.5,280);
        textSize(20);
        textAlign(CENTER);
        text("Puissance : "+valeur1[1]+" W",492.25,910);
        text("Puissance : "+valeur2[1]+" W",816.75,910);
      }
    }
 }
}

void mousePressed() {
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
  if(valider.clicked()){
    pin="";
    for(i=0;i<4;i++){
      pin=pin+cases[i].getValeur();
    }
 
   System.out.print(vraipin);
    if(pin.equals(vraipin))
    {
      page=1;
      port.write("OK\n");
    }
    else
    {
        fill(200,0,0);
        textSize(20);
        textAlign(CENTER);
        text("PIN incorrect",900,700);
    }
  }
  cases[0].cliquer();
  cases[1].cliquer();
  cases[2].cliquer();
  cases[3].cliquer();
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
