Bouton[] barDeMenu;
int i;

void setup(){
  size(1800,1000);
  barDeMenu=new Bouton[7];
  for(i=0;i<7;i++){
    barDeMenu[i]=new Bouton();
    barDeMenu[i].setPosition(25,90+i*70,300,60);
    barDeMenu[i].setColor(10,10,10);
  }
  barDeMenu[0].setText("  Tableau de bord");
  barDeMenu[1].setText("  Prises");
  barDeMenu[2].setText("  Planning");
  barDeMenu[3].setText("  Minuterie");
  barDeMenu[4].setText("  Consommation");
  barDeMenu[5].setText("  Historique");
  barDeMenu[6].setText("  Paramatres");
}

void draw(){
  background(0);
  fill(0);
  strokeWeight(2);
  rect(15,30,width-30,height-50,15);
  stroke(200,200,200);
  noStroke();
  for(i=0;i<7;i++){
    barDeMenu[i].display();
  }
}
