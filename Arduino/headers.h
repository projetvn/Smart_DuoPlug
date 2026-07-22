#include <math.h>
#include <Adafruit_SSD1306.h>
#include "Clavier.h"
#include "Prise.h"

extern Adafruit_SSD1306 ecran;
extern Clavier clavier;
extern Prise p1, p2;
extern int pinC1, pinC2, countmin1, countmin2;

void menu();
void activationPrise();
void desactivationPrise();
void voirEtatPrise();
void parametre();
void minuterie();
char choisir();
void options(Prise p);
