#include "Keypad.h"
#include "Clavier.h"
#include "Arduino.h"
Clavier::Clavier()
  : touches{
      {'1','2','3'},
      {'4','5','6'},
      {'7','8','9'},
      {'*','0','#'}
    },
    pinsLignes{9, 8, 7, 6},
    pinsColonnes{5, 4, 3},
    clavier(makeKeymap(touches), pinsLignes, pinsColonnes, LIGNES, COLONNES),
    touche(' ')
{
}
Clavier::~Clavier()
{

}

void Clavier::ecrire()
{
  char temp;
  temp = clavier.getKey();
  if(temp)
  {
    touche = temp;
  }
  else
  {
    touche = ' ';
  }
}
char Clavier::lire()
{
  if(touche!=' ')
    return touche;
  else
   return 'v';;
}