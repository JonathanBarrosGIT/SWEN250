// Jonathan Correia de Barros
// Oct 14th 2015
// Temperature Converter Part 1

#include <stdlib.h>
#include <stdio.h>

int main()
{
	int celsius;
	int fahrenheit = 0;
	printf("Fahrenheit -> Celsius\n");

	for(fahrenheit; fahrenheit <= 300 ; fahrenheit += 20)
	{
		celsius = (5 * (fahrenheit - 32)) / 9;
		printf("%d -> %d\n", fahrenheit, celsius);
	}
	return 0;
}
