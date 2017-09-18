#include <iostream>
using namespace std;

class Num {
    private:
        int value;
    public:
        Num(int);
        int get() const;
        void show();
};

Num::Num(int v) {
    value = v;
}
void Num::show() {
    cout << "hi!" << endl;
}

int Num::get() const{
    return value;
}

int main() {
    Num n(4); 
    cout << n.get() << endl;
    n = 20.0;
    cout << n.get() << endl;
    n.show();
}
