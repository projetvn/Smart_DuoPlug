#ifndef DEF_CLAVIER
#define DEF_CLAVIER
#include "Arduino.h"
#include <Keypad.h>

const byte LIGNES = 4;
const byte COLONNES = 3;

class Clavier
{
  public:
    Clavier();
    ~Clavier();
    void ecrire();
    char lire();

  private:
    char touches[LIGNES][COLONNES];
      byte pinsLignes[LIGNES];
      byte pinsColonnes[COLONNES];
    Keypad clavier;
    char touche;
};

#endif