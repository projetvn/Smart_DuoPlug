#include <Adafruit_SSD1306.h>
#include "Clavier.h"
#include "PinCode.h"

extern Adafruit_SSD1306 ecran;
extern Clavier clavier;
extern PinCode PIN;
void creerPinCode();
void modifierPINCode();
int login();