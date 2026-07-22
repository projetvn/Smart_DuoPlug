#include "headers.h"
void activationPrise()
{
  int v;
  v=0;
  char c;
  c = ' ';
  debut:
  if(v!=0)
  {
    ecran.clearDisplay();
    ecran.setCursor(0, 0);
    ecran.print(F("Choix invalide\n"));
    ecran.display();
  }
  else
  {
    ecran.clearDisplay();
    ecran.setCursor(0, 0);
  }
  ecran.print(F("Quelle prise voulez vous activer?(1/2) : \n"));
  ecran.display();
  c=choisir();
  if(c=='1')
  {
    options(p1);
  }

  else if(c=='2')
  {
    options(p2);
  }
}

void options(Prise p)
{
  String minutes;
  char c;
  if(p.getStatus()==1)
  {
    ecran.clearDisplay();
    ecran.setCursor(0, 0);
    ecran.print(F("Prise occupee!!\n"));
    ecran.display();
  }
  else
  {
    ecran.clearDisplay();
    ecran.setCursor(0, 0);
    ecran.print(F("Vous voulez alimenter(1) ou charger(2)? : "));
    ecran.display();
    c=choisir();
    if(c=='1')
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("Combien de minute souhaiter vous alimenter?\nMinutes (# pour valider): "));
      ecran.display();
      while (minutes.length()=='0' || minutes[minutes.length()-1]!='#')
      {
        clavier.ecrire();
        c=clavier.lire();
        if(c!='v' && c!='*')
        {
          minutes.concat(c);
        }
      }
      minutes.remove(minutes.length()-1);
      p.setTimOn(minutes.toInt());
      p.allumer();
      ecran.print(F("Prise activee pour alimenter\n"));
      p.setDebutOn(millis());
    }
    else if(c=='2')
    {
      p.allumer();
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("Prise activee pour charger\n"));
      ecran.display();
    }
    else
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("Choix invalide\n"));
    }
  }
}

void minuterie()
{
  if(p1.getDebuOn()!=0)
  {
    countmin1+=millis()-p1.getDebuOn();
    if(countmin1-10>=p1.getTimeOn())
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("La prise 1 se desactivera dans 10 minutes\n"));
      ecran.display();
    }
    if(countmin1>=p1.getTimeOn())
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("Pise 1 desactivee\n"));
      ecran.display();
      p1.eteindre();
      countmin1=0;
    }
  }

  if(p2.getDebuOn()!=0)
  {
    countmin2+=millis()-p2.getDebuOn();
    if(countmin2-10>=p2.getTimeOn())
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("La prise 2 se desactivera dans 10 minutes\n"));
      ecran.display();
    }
    if(countmin2>=p2.getTimeOn())
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("Pise 2 desactivee\n"));
      ecran.display();
      p2.eteindre();
      countmin2=0;
    }
  }
}

void desactivationPrise()
{
  char c;
  ecran.clearDisplay();
  ecran.setCursor(0,0);
  ecran.print(F("QUelle prise voulez vous desactiver?(1/2) : "));
  ecran.display();
  c = choisir();
  if(c=='1')
  {
    p1.eteindre();
    ecran.clearDisplay();
    ecran.setCursor(0,0);
    ecran.print(F("Prise 1 desactivee avec succes\n"));
    ecran.display();
  }
  else if(c=='2')
  {
    p2.eteindre();
    ecran.clearDisplay();
    ecran.setCursor(0,0);
    ecran.print(F("Prise 2 desactivee avec succes\n"));
    ecran.display();
  }
  else
  {
    ecran.clearDisplay();
    ecran.setCursor(0,0);
    ecran.print(F("Choix invalide\n"));
    ecran.display();
  }
}

void voirEtatPrise()
{
  char c;
  ecran.clearDisplay();
  ecran.setCursor(0, 0);
  ecran.print(F("Quelle prise?(1/2) :"));
  ecran.display();
  c=choisir();
  if(c=='1')
  {
    ecran.clearDisplay();
    ecran.setCursor(0, 0);
    if(p1.getStatus()==1)
    {
      ecran.print(F("Prise activee\n"));
      ecran.display();
    }
    else
    {
      ecran.print(F("Prise desactivee\n"));
      ecran.display();
    }
  }
}