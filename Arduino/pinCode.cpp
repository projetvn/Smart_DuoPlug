#include "pinCode.h"
#include <EEPROM.h>

pinCode::pinCode()
{

}

pinCode::~pinCode()
{

}

void pinCode::setPincode(int p)
{
  pincode = p;
  EEPROM.put(0, p);
}

int pinCode::getPincode()
{
  int p;
  EEPROM.get(0, p);
  return p;
}