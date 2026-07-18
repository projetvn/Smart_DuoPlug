#include"Prise.h"
#include<Arduino.h>

Prise::Prise(){}

Prise::~Prise(){}

void Prise::allumer(){
  pinMode(pin,HIGH);
  status=1;
}

void Prise::eteindre(){
  pinMode(pin,LOW);
  status=0;
}

void Prise::setPin(int pin){
  this->pin=pin;
}

void Prise::setConsommation(double valeur){
  consommation=valeur;
}

int Prise::getStatus(){
  return status;
}

double Prise::getConsommation(){
  return consommation;
}