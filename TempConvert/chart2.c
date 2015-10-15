// Jonathan Correia de Barros
// Oct 14th 2015
// Temperature Converter Part 2

#include <stdlib.h>
#include <stdio.h>

int main()
{
	float fahrenheit = 0;
	printf("Fahrenheit-Celsius\n");

	for(fahrenheit; fahrenheit <= 300 ; fahrenheit += 20)
	{
		printf("   ");
		printf("%3.0f",fahrenheit);
		printf("      ");
		printf("%5.1f\n", 5 * (fahrenheit - 32) / 9);
	}
	return 0;
}
