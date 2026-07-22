#include "WString.h"
#include "wiring_private.h"
#include "headers.h"
#include "Arduino.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
void menu()
{
  int v;
  v=0;
  char c;
  String choix;
  choix="";
  c = ' ';
  MenuPrincipal :
    if(v!=0)
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("Choix invalide!!!\n"));
      ecran.display();
    }
    else
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
    }
    ecran.print(F("Menu principal\n"));
    ecran.display();
    ecran.print(F("1.Activer une prise\n2.Desactiver une prise\n.3.Voir l'etat d'une prise\n4.Parametres\n"));
    ecran.display();
    ecran.print(F("Votre choix (# pour valider) : "));
    ecran.display();

    while(choix.length()==0 || choix[choix.length()-1]!='#')
    {
      clavier.ecrire();
      c = clavier.lire();
      if(c!='v')
      {
        choix.concat(c);
        if(c!='#')
        {
          ecran.print(c);
          ecran.display();
        }
      }
    }
    c=choix[0];
    choix.remove(0);
    switch(c)
    {
      case '1':
        activationPrise();
        break;
      case '2':
        desactivationPrise();
        break;

      case '3':
        voirEtatPrise();
        break;

      case '4':
        parametre();
        break;

      default:
        v++;
        goto MenuPrincipal;
    }
    
}

void parametre()
{

}

char choisir()
{
  char c;
  String choix;
  choix="";
  c = ' ';
  while(choix.length()==0 || choix[choix.length()-1]!='#')
  {
    clavier.ecrire();
    c = clavier.lire();
    if(c!='v')
    {
      choix.concat(c);
      if(c!='#')
      {
        ecran.print(c);
        ecran.display();
      }
    }
  }
  return choix[0];
}
