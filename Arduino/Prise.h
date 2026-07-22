#ifndef DEF_PRISE
#define DEF_PRISE

class Prise{
  private:
    int pin;
    int status;//0 OFF 1 ON
    double consommation;
    int timeOn;
    int debutOn;

  public:
    Prise();
    ~Prise();
    void allumer();
    void eteindre();
    void setPin(int pin);
    void setConsommation(int pinC);
    void setTimOn(int t);
    void setDebutOn(int d);
    int getStatus();
    double getConsommation();
    int getTimeOn();
    int getDebuOn();

};

#endif