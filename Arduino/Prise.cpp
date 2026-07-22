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

void Prise::setConsommation(double valeur){
  consommation=valeur;
}

void Prise::setTimOn(int t){
  timeOn=t;
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