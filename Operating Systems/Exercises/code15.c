#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <ctype.h>
#define READ_END 0
#define WRITE_END 1

void strupper(char *str);
int main(int argc, char const *argv[])
{
    int parent_fd[2];
    int child_fd[2];

    // Pipe Error
    if ((pipe(child_fd) != 0) || (pipe(parent_fd) != 0))
    {
        fprintf(stderr, "%s failed to open pipe()\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    pid_t pid;
    if ((pid = fork()) == 0)
    {
        // Child

        close(child_fd[WRITE_END]);
        close(parent_fd[READ_END]);

        /*
        While the child pipe is not closed it reads a letter from the parent
        and it returns the uppercase version of that letter to the parent
        */
        char buffer;
        while (read(child_fd[READ_END], &buffer, sizeof(char)) > 0)
        {
            buffer = toupper(buffer);
            write(parent_fd[WRITE_END], &buffer, sizeof(char));
        }
        close(child_fd[READ_END]);
        close(parent_fd[WRITE_END]);

        exit(EXIT_SUCCESS);
    }
    else if (pid > 0)
    {
        // Parent

        close(parent_fd[WRITE_END]);
        close(child_fd[READ_END]);

        char *line = NULL;
        size_t size = 0;
        ssize_t buff;

        /*
        To communicate with the child process the characters are written to the
        pipe 1 by 1
        */
        while ((buff = getline(&line, &size, stdin)) != -1)
        {
            for(int i=0;i<buff;i++)
                write(child_fd[WRITE_END], (line+i),sizeof(char));
        }

        close(child_fd[WRITE_END]);

        /* Reading child output */
        char upperChar;
        while (read(parent_fd[READ_END], &upperChar, sizeof(char)))
            putchar(upperChar);

        close(parent_fd[READ_END]);
        wait(NULL);
        exit(EXIT_SUCCESS);
    }
    else
    {
        // Error
        fprintf(stderr, "%s failed fork()\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    return EXIT_SUCCESS;
}

void strupper(char *str)
{
    while (*str)
    {
        *str = toupper((unsigned char)*str);
        str++;
    }
}
