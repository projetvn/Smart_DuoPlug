#include "PinCode.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "Clavier.h"
#include "authentification.h"
#include "diversFonctions.h"
#include "Prise.h"


#define LARGEUR_ECRAN 128
#define LONGUEUR_ECRAN 64

Adafruit_SSD1306 ecran(LARGEUR_ECRAN, LONGUEUR_ECRAN, &Wire, -1);
int pinMR1, pinMR2, pinC1, pinC2, Login;
Clavier clavier;
Prise p1, p2;

PinCode PIN;
void setup() {
  // put your setup code here, to run once:
  ecran.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  p1.setPin(2);
  p2.setPin(10);
  pinC1 = A1;
  pinC2 = A2;
  Login = 0;
  pinMode(2, OUTPUT);
  pinMode(10, OUTPUT);

  p1.eteindre();
  p2.eteindre();
  ecran.clearDisplay();
  ecran.setCursor(0, 0);
  ecran.setTextSize(1);
  ecran.setTextColor(SSD1306_WHITE);
  ecran.print(PIN.getPinCode());
  ecran.display();
  if(PIN.getPinCode()==0)
  {
    creerPinCode();
  }
  else
  {
    Login=login();
    ecran.println(Login);
    ecran.display();
    if(Login==1)
    {
      menu();
    }
  }

}

  void loop() {
  // put your main code here, to run repeatedly:

}
