#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

int f(char* content) {
char str[8];
int result = 2;
(void)strcpy(str, content);
return result;
}

int main(int argc, char* argv[]) {
if (argc == 2)
printf("result = %d\n", f(argv[1]));
return EXIT_SUCCESS;
}

/*
./3.2 a
./3.2 ab
./3.2 abc
./3.2 abcd
./3.2 abcde
./3.2 abcdef
./3.2 abcdefg
./3.2 abcdefgh
./3.2 abcdefghi
./3.2 abcdefghij
*/
