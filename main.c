#include <stdio.h>
#include <string.h>

extern size_t   ft_strlen(const char *str);
extern char*    ft_strcpy(char* destination, const char* source);
extern int      ft_strcmp( const char *str1, const char *str2);

int main()
{
    printf("Printing STRLEN Test Case\n");
    char *str = "hello";
    char *str2 = "world";

    size_t len = ft_strlen(str);
    size_t reallen = strlen(str);
    printf("asm strlen: %zu\n", len);
    printf("lib strlen: %zu\n", reallen);


    printf("Printing STRCPY Test Case\n");

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

    printf("Printing STRCMP Test Case\n");

    char *str_right = "hello";
    char *str_greater = "hello-zope";
    char *str_lesser = "hell";

    printf("strcmp-lib-correct: %d\n", strcmp(str, str_right));
    printf("strcmp-lib-greater: %d\n", strcmp(str, str_greater));
    printf("strcmp-lib-lesser: %d\n", strcmp(str, str_lesser));

    printf("strcmp-asm-correct: %d\n", ft_strcmp(str, str_right));
    printf("strcmp-asm-greater: %d\n", ft_strcmp(str, str_greater));
    printf("strcmp-asm-lesser: %d\n", ft_strcmp(str, str_lesser));



    return 0;
}