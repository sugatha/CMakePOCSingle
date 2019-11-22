#include <iostream>
#include "mylibshared.h"

int main()
{
   std::cout << "Hey! - a shout from a terra-firmian :) " << std::endl;

   UseMyClass myclass_obj;
   
   myclass_obj.PrintUseMyClassHello();
   getchar();
   return 0;
}