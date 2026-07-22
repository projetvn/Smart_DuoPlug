#include "authentification.h"
#include "Arduino.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

void creerPinCode()
{
  String p;
  char c;
  ecran.clearDisplay();
  ecran.setCursor(0, 0);
  ecran.println("Bienvenue !");
  ecran.display();
  ecran.println("Veuillez creer un code pin a 4 chiffres pour securiser votre prise");
  ecran.display();
  do
  {
    ecran.print("PIN (# pour valider): ");
    ecran.display();
    while(p.length()==0 || p[p.length()-1]!='#')
    {
      clavier.ecrire();
      c = clavier.lire();
      if(c!='v')
      {
        p.concat(c);
        if(c!='#')
        {
          ecran.print(c);
          ecran.display();
        }
      }
    }
    p.remove(p.length()-1);
    if(p.length()!=4)
    {
      ecran.print(F("Le pin doit etre compose de 4 chiffre"));
      ecran.display();
      delay(2000);
      p.remove(0);
    }
    ecran.clearDisplay();
    ecran.setCursor(0, 0);
  }
  while(p.length()!=4);
  PIN.setPinCode(p.toInt());
  delay(500);
  ecran.clearDisplay();
  ecran.setCursor(0, 0);
  ecran.print(F("Code pin cree avec succes!"));
  ecran.display();
}

int login()
{
  String p;
  char c;
  ecran.clearDisplay();
  ecran.setCursor(0, 0);
  ecran.print(F("Bienvenu dans la page de login"));
  ecran.display();
  do
  {
    ecran.print(F("PIN (# pour valider): "));
    ecran.display();
    while(p[p.length()-1]!='#')
    {
      clavier.ecrire();
      c = clavier.lire();
      if(c!='v')
      {
        p.concat(c);
        if(c!='#')
        {
          ecran.print(c);
          ecran.display();
        }
      }
    }
    p.remove(p.length()-1);
    if(p.toInt()!=PIN.getPinCode())
    {
      ecran.clearDisplay();
      ecran.setCursor(0, 0);
      ecran.print(F("Code pin incorrect!!!"));
      ecran.display();
    }
  }while (p.toInt()!=PIN.getPinCode());
  delay(500);
  ecran.clearDisplay();
  ecran.setCursor(0, 0);
  ecran.print(F("Login reussi!\n"));
  ecran.display();
  return 1;
}