#include "mylibshared.h"

using namespace std;

UseMyClass::UseMyClass()   
{

}

void UseMyClass::PrintUseMyClassHello()
{
	cout << "Oops! me from the - Shared world !!" << endl;
	myclass.PrintStaticLibHello();
	PrintStaticUtilLibHello();
   
}
