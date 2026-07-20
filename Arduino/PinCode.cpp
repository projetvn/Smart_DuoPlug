#include "PinCode.h"
#include <EEPROM.h>

PinCode::PinCode()
{

}

PinCode::~PinCode()
{

}

void PinCode::setPinCode(int p)
{
  pinCode = p;
  EEPROM.put(0, p);
}

int PinCode::getPinCode()
{
  int p;
  EEPROM.get(0, p);
  return p;
}
