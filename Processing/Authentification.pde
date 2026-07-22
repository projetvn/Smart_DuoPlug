PinBox[] cases;
String str;
Bouton valider;

void initialiserAuthentification(){
  cases=new PinBox[4];
  cases[0]=new PinBox(750,400);
  cases[1]=new PinBox(850,400);
  cases[2]=new PinBox(950,400);
  cases[3]=new PinBox(1050,400);
  cases[0].setStatus(true);
}

void afficherAuthentification(){
  valider=new Bouton(); 
  background(11,11,20); 
  fill(250); 
  
  rectMode(CORNER);
  noStroke();
  valider.setColorh(100,85,150);
  valider.setColor(127,119,221); 
  valider.setTextColor(255); 
  valider.setText("Valider"); 
  valider.setTextxPosition(900); 
  textAlign(CENTER);
  valider.setPosition(650,515,500,70);
  valider.display();
  
  textSize(50); 
  text("Entrez votre code",900,200); 
  fill(139,138,153);
  textSize(20); 
  text("Code PIN a 4 chiffres, saisi au clavier",900,250);

  cases[0].afficher();
  cases[1].afficher();
  cases[2].afficher();
  cases[3].afficher();
}

void keyPressed(){
  if(key>='0' && key<='9'){
    if(cases[0].getValeur().equals("")){
      cases[0].ajouterChiffre(key);
      cases[1].setStatus(true);
      cases[0].setStatus(false);
    }
    else if(cases[1].getValeur().equals("")){
      cases[1].ajouterChiffre(key);
      cases[2].setStatus(true);
      cases[1].setStatus(false);
    }
    else if(cases[2].getValeur().equals("")){
      cases[2].ajouterChiffre(key);
      cases[3].setStatus(true);
      cases[2].setStatus(false);
    }
    else if(cases[3].getValeur().equals("")){
      cases[3].ajouterChiffre(key);
    }
  }

  if(key==BACKSPACE){
    if(!cases[3].getValeur().equals(""))
      cases[3].supprimer();
    else if(!cases[2].getValeur().equals(""))
      cases[2].supprimer();
    else if(!cases[1].getValeur().equals(""))
      cases[1].supprimer();
    else if(!cases[0].getValeur().equals(""))
      cases[0].supprimer();
  }
}
