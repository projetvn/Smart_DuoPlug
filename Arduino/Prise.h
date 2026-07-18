class Prise{
  private:
  int pin;
  int status;//0 OFF 1 ON
  double consommation;

  public:
  Prise();
  ~Prise();
  void allumer();
  void eteindre();
  void setPin(int pin);
  void setConsommation(double valeur);
  int getStatus();
  double getConsommation();
};