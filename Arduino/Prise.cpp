#include <avr/interrupt.h>
#include <math.h>
#include"Prise.h"
#include<Arduino.h>

Prise::Prise(){}

Prise::~Prise(){}

void Prise::allumer(){
  digitalWrite(pin,HIGH);
  status=1;
}

void Prise::eteindre(){
  digitalWrite(pin,LOW);
  status=0;
}

void Prise::setPin(int pin){
  this->pin=pin;
}

void Prise::setConsommation(int pinC){
  float valeur, tension, courant;
  valeur = analogRead(pinC);
  tension = (valeur/1023.0)*5.0;
  courant = (tension-2.5)/0.066;
  consommation = 220*courant;
}

void Prise::setTimOn(int t){
  timeOn=t;
}

void Prise::setDebutOn(int d){
  debutOn=d;
}

int Prise::getStatus(){
  return status;
}

double Prise::getConsommation(){
  return consommation;
}

int Prise::getTimeOn(){
  return timeOn;
}

int Prise::getDebuOn(){
  return debutOn;
}