
#include "includes/libasm.h"
#include "stdlib.h"
#include "unistd.h"
#include "fcntl.h"

int main()
{
    printf("\nPrinting STRLEN Test Case\n");
    char *str = "hello";
    char *str2 = "world";
    char buffer[1024];

    char path[] = "./file.txt";
    int fd = open(path, O_RDONLY);
    char *strdupstr;

    size_t len = ft_strlen(str);
    size_t reallen = strlen(str);
    printf("asm strlen: %zu\n", len);
    printf("lib strlen: %zu\n", reallen);

    printf("\nPrinting STRCPY Test Case\n");

    char strcopylib[50];
    char strcopyasm[50];
    ft_strcpy(strcopyasm, str);
    strcpy(strcopylib, str);
    printf("lib strcpy: %s\n", strcopylib);
    printf("asm strcpy: %s\n", strcopyasm);
    ft_strcpy(strcopyasm, str2);
    strcpy(strcopylib, str2);
    printf("lib strcpy: %s\n", strcopylib);
    printf("asm strcpy: %s\n", strcopyasm);

    printf("\nPrinting STRCMP Test Case\n");

    char *str_right = "hello";
    char *str_greater = "hello+nope";
    char *str_lesser = "0";

    printf("strcmp-lib-correct: %d\n", strcmp(str, str_right));
    printf("strcmp-lib-greater: %d\n", strcmp(str, str_greater));
    printf("strcmp-lib-lesser: %d\n", strcmp(str, str_lesser));

    printf("strcmp-asm-correct: %d\n", ft_strcmp(str, str_right));
    printf("strcmp-asm-greater: %d\n", ft_strcmp(str, str_greater));
    printf("strcmp-asm-lesser: %d\n", ft_strcmp(str, str_lesser));

    printf("\nPrinting Write Test Case\n");
    write(1, str, strlen(str));
    ft_write(1, str, strlen(str));
    printf("\nPrinting READ Test Case\n");
    read(fd, buffer, 1024);
    printf("%s\n", buffer);
    ft_read(fd, buffer, 1024);
    printf("%s\n", buffer);
    printf("\nPrinting strdup Test Case\n");
    strdupstr = ft_strdup(str);
    printf("strdup: %s\n", strdupstr);
    return 0;
}