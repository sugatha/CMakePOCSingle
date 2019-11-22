#pragma once

#include "myclass.h"
#include "myutilclass.h"

class EXPORT_SYMBOL UseMyClass
{
   MyClass		myclass;
   
public:
	UseMyClass();
	void PrintUseMyClassHello();

};