#include "PinCode.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "Clavier.h"
#include "authentification.h"
#include "headers.h"
#include "Prise.h"


#define LARGEUR_ECRAN 128
#define LONGUEUR_ECRAN 64

Adafruit_SSD1306 ecran(LARGEUR_ECRAN, LONGUEUR_ECRAN, &Wire, -1);
int pinC1, pinC2, Login, debut1, debut2, countmin1, countmin2;
Clavier clavier;
Prise p1, p2;

PinCode PIN;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  ecran.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  p1.setPin(2);
  p2.setPin(10);
  pinC1 = A1;
  pinC2 = A2;
  Login = 0;
  debut1=0;
  debut2=0;
  countmin1=0;
  countmin2=0;
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
    if(Login==1)
    {
      ecran.print(F("1\n"));
      ecran.display();
      menu();
    }
    Serial.println(PIN.getPinCode());
    
  }
}

  void loop() {
  // put your main code here, to run repeatedly:
  p1.setConsommation(pinC1);
  p2.setConsommation(pinC2);
  Serial.print("p1:");
  Serial.print(p1.getStatus());
  Serial.print(",");
  Serial.print(p1.getConsommation());
  Serial.print(" ");
  Serial.print("p2:");
  Serial.print(p2.getStatus());
  Serial.print(",");
  Serial.println(p2.getConsommation());
  minuterie();
}
