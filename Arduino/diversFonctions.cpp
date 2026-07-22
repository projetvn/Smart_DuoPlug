#include "diversFonctions.h"
#include "Arduino.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
void menu()
{
  char choix, temp;
  choix = ' ';
  temp = ' ';
  Menu :
    ecran.clearDisplay();
    ecran.setCursor(0, 0);
    ecran.println("Menu principal");
    ecran.display();
    ecran.print(F("1.Allumer/Etteindre une prise\n.2.Voir l'etat d'une prise\n3.Parametres\n"));
    ecran.display();
    ecran.print(F("Votre choix (# pour valider) : "));
    ecran.display();
    while(choix==' ' || temp!='#')
    {
      clavier.ecrire();
      temp = clavier.lire();
      if(temp=='#' && choix==' ')
      {
        ecran.clearDisplay();
        ecran.setCursor(0, 0);
        ecran.print(F("Entrer un chiffre!!"));
        ecran.display();
        ecran.print(F("1.Allumer/Etteindre une prise\n.2.Voir l'etat d'une prise\n3.Parametres\n"));
        ecran.display();
        ecran.print(F("Votre choix (# pour valider) : " ));
        ecran.display();
        temp=' ';
      }
      else if(temp!='#' && temp!=' ' && temp!= 'v')
      {
        choix = temp;
        ecran.println(choix);
        ecran.display();
      }
    }

    /*switch(choix)
    {
      cases '1':

    }
    */
}