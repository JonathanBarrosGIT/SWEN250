/*
 * Jonathan Correia de Barros
 * Oct 30th 2015
 * bubble sort
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "bubble_sort.h"
#include "unit_tests.h"

// Swaps the characters at myarray[position] and myarray[position + 1].
// It is up to the calling program to ensure that position + 1 is a valid array location.
// If myarray[position] or myarray[position + 1] is an end of string ('\0') do not swap.
// This is an example of defensive programming.
// You are NOT allowed to use any library functions like swap().
void swap_characters_in_array( char myarray[], int position )
{
	char helperChar;

	if(myarray[position] != '\0' && myarray[position + 1] != '\0')
	{
		helperChar = myarray[position];
		myarray[position] = myarray[position + 1];
		myarray[position + 1] = helperChar;
	}
}

// Recursively sorts two characters in an array by their numeric value
// not a very good sort for alphabetic ordering).
// Returns the number of times a pair of characters were actually swapped.
int sort_two_positions(char myarray[], int position)
{
	int swap_was_done = 0 ;
	
	// First see if myarray[position] or myarray[position + 1] is an end of string ('\0').
	// If so, then just return with a zero value.

	if(myarray[position] == '\0' || myarray[position + 1] == '\0')
		return 0;
	
	// Fill in code to decide on whether or not a swap is needed.
	// If a swap is needed use the swap_characters_in_array function you completed above
	// and set swap_was_done to a 1.

	if(myarray[position] > myarray[position + 1])
	{
		swap_characters_in_array(myarray, position);
		swap_was_done = 1;
	}
	
	// Now call this function recursively for the next position in the array.
	// This recursive call should look like this where you fill in the ? for the two parameters.
	return swap_was_done + sort_two_positions(myarray, position + 1);


}

// Implement this function that repeatedly calls sort_two_positions until the entire string is sorted.
// This is the top level function that is called by the unit tests.
void sort( char myarray[], int position )
{
	while(sort_two_positions(myarray, position) > 0)
	{
		sort_two_positions(myarray, position);
	}
	// Fill in the code for calling until all positions are in correct ascending sort order.
}


// Run the unit tests or as a "normal program".
// You can run this as a "normal program" if you want for a simple test of the sort_two_positions function.
int main( int argc, char *argv[] ) {
	char one_string[] = "test" ;
	int positions_swapped = 0 ;

	// Execute unit tests if program name contains "test".
	if ( strstr( argv[0], "test" ) )
		return test() ;

	// Simple test for the mid-level function.
	positions_swapped = sort_two_positions( one_string, 0 ) ;
	printf( "%d positions swapped. New string is: %s\n", positions_swapped, one_string ) ;
	
	return 0 ;
}
