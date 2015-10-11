/**
 * Jonathan Correia de Barros
 * 
 * /

#include <stdlib.h>
#include <stdio.h>

#define MAXLINE 80   /* maximum input line size */

/* function declarations */
extern int readline( char line[], int max );
extern void copy( char to[], char from[] );

/*
 * main:
 *     Print longest input line
 * Note: You may have to declare additional variables.
 */

int main() {
	int len;	       /* current line length */
	char line[MAXLINE];    /* current input line */

	while ( (len = readline( line, MAXLINE )) > 0 ) {
		printf("%s\n", line);
		/* Fill in with code to save the longest line */
	}

	return 0; // return success code
}

/*
 * readline:
 *   Read a line into array <s> and return its length.
 *      * The string in <s> must be properly terminated.
 *      * At most <max_chars> are read; excessive characters are
 *        discarded.
 *      * The length returned is the length of the entire
 *        line, not just the piece that is copied.
 *      * A terminating newline ('\n') is *not* copied over.
 *      * If EOF is encountered, return (-1).
 * Note: You may have to declare additional variables.
 */
int readline( char s[], int max_chars ) {
	/* your code here */
	return 0 ; // placeholder for the real return value.
}

/* copy:
 *    Copy proper C string <from> into <to>
 *    Assume <to> has enough space to hold a copy of <from>.
 * Note: You may have to declare additional variables.
 */
void copy( char to[], char from[] ) {
	/* your code here */
}
