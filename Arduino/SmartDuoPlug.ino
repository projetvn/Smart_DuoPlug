#include "PinCode.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "Clavier.h"
#include "authentification.h"

#define LARGEUR_ECRAN 128
#define LONGUEUR_ECRAN 64

Adafruit_SSD1306 ecran(LARGEUR_ECRAN, LONGUEUR_ECRAN, &Wire, -1);
int pinMR1, pinMR2, pinC1, pinC2, Login;
Clavier clavier;

PinCode PIN;
void setup() {
  // put your setup code here, to run once:
  ecran.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  pinMR1 = 2;
  pinMR2 = 3;
  pinC1 = A1;
  pinC2 = A2;
  Login = 0;
  pinMode(pinMR1, OUTPUT);
  pinMode(pinMR2, OUTPUT);

  // Initialisation des modules relais en position OUVERTE (pas de courant qui passe)
  // MR1 et MR2 ont une logique inversée entre eux : donc
  // MR1 est actif à l'état LOW, donc HIGH = ouvert (relais au repos)
  // MR2 est actif à l'état HIGH, donc LOW = ouvert (relais au repos)
  digitalWrite(pinMR1, HIGH); 
  digitalWrite(pinMR2, LOW);
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
  }

}

  void loop() {
  // put your main code here, to run repeatedly:

}
