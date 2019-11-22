#pragma once


#include <iostream>

#ifdef EXP_MODULE
#define EXPORT_SYMBOL __declspec(dllexport)
#else
#define EXPORT_SYMBOL __declspec(dllimport)
#endif

using namespace std;

class EXPORT_SYMBOL MyUtilClass
{
	char szName[128];
public:
	MyUtilClass();
	~MyUtilClass();
	void PrintStaticUtilLibHello();
};