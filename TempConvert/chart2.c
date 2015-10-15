// Jonathan Correia de Barros
// Oct 14th 2015
// Temperature Converter Part 2

#include <stdlib.h>
#include <stdio.h>

int main()
{
	//float celsius;
	float fahrenheit = 0;
	printf("Fahrenheit - Celsius\n");

	for(fahrenheit; fahrenheit <= 300 ; fahrenheit += 20)
	{
		//celsius = (5 * (fahrenheit - 32)) / 9;
		printf("%7.0f",fahrenheit);
		printf("%1.1f\n", 5 * (fahrenheit - 32) / 9);
		//printf("%7.0f      %4.1f\n", fahrenheit, 5 * (fahrenheit - 32) / 9);
	}
	return 0;
}
