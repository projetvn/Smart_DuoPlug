#ifndef DEF_PINCODE
#define DEF_PINCODE

class PinCode
{
  public:
    PinCode();
    ~PinCode();
    void setPinCode(int p);
    int getPinCode();
  private:
    int pinCode;
};

#endif
