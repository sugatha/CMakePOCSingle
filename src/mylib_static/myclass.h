#pragma once

#include "libdef.h"
#include <iostream>



class EXPORT_SYMBOL MyClass
{
	char szName[128];
public:
	MyClass();
	~MyClass();
	void PrintStaticLibHello();
};