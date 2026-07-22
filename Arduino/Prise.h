#ifndef DEF_PRISE
#define DEF_PRISE

class Prise{
  private:
    int pin;
    int status;//0 OFF 1 ON
    double consommation;
    int timeOn;

  public:
    Prise();
    ~Prise();
    void allumer();
    void eteindre();
    void setPin(int pin);
    void setConsommation(double valeur);
    void setTimOn(int t);
    int getStatus();
    double getConsommation();
    int getTimeOn();

};

#endif