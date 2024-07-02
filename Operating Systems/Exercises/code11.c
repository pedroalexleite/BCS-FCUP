#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>


void inSearch(FILE *in, FILE *out, const char *keyword);

int main(int argc, char *argv[])
{
    FILE *f;

    if(argc != 3){
        fprintf(stderr, "%s requires 3 arguments\n",  argv[0]);
        exit(EXIT_FAILURE);
    }

    if ((f = fopen(argv[2], "r")) != NULL)
        inSearch(f, stdout, argv[1]);

    fclose(f);
    return EXIT_SUCCESS;
}

void inSearch(FILE *in, FILE *out, const char *keyword)
{
    char* line;
    char *ret;
    int lineCount = 1, col;

    size_t buff = 0;
    ssize_t read;
    while ((read = getline(&line, &buff, in)) != -1)
    {
        ret = strstr(line, keyword);
        if (ret != NULL)
        {
            col = ret - line + 1;
            printf("[%d:%d", lineCount, col);
            while ((ret = strstr(ret + 1, keyword)) != NULL)
            {
                col = ret - line + 1;
                printf(",%d", col);
            }
            printf("]\n");
        }
        ++lineCount;
    }
}
