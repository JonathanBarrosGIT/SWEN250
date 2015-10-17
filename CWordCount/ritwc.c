/**
/*	Jonathan Correia de Barros
/*	Oct 16th 2015
/* 	Word Count
**/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#define FALSE (0)
#define TRUE  (1)

int main() {
	int tot_chars = 0 ;	/* total characters */
	int tot_lines = 0 ;	/* total lines */
	int tot_words = 0 ;	/* total words */

	FILE *file;
	int boolean = TRUE;
	unsigned char character;

	file = fopen("DarkAndStormyNight.txt", "r");
	if(file == NULL) perror ("Error opening file");
	else
	{
		character = fgetc(file);
		while(!feof(file))
		{
			tot_chars++;

			if(character == '\n')
			{
				tot_lines++;
			}
			if(isspace(character))
			{
				boolean = TRUE;
			}
			else if(boolean)
			{
				tot_words++;
				boolean = FALSE;
			}
			character = fgetc(file);
		}
	}

	printf("%d %d %d\n", tot_lines, tot_words, tot_chars);

	fclose(file);
	return 0;
}
