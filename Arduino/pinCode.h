#ifndef DEF_PINCODE
#define DEF_PINCODE

class pinCode
{
  public:
    pinCode();
    ~pinCode();
    void setPincode(int p);
    int getPincode();
  private:
    int pincode;
};

#endif