#include "includes/libasm.h"
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>

void test_strlen(void) {
    printf("\n=== Testing ft_strlen ===\n");
    const char *test_strings[] = {
        "hello",
        "",
        "This is a longer string to test",
        "1234567890",
        "Special chars: !@#$%^&*()"
    };
    
    for (int i = 0; i < sizeof(test_strings) / sizeof(char*); i++) {
        size_t lib_len = strlen(test_strings[i]);
        size_t ft_len = ft_strlen(test_strings[i]);
        printf("String: \"%s\"\n", test_strings[i]);
        printf("libc strlen: %zu\n", lib_len);
        printf("ft_strlen:   %zu\n", ft_len);
        printf("Test %s\n", (lib_len == ft_len) ? "PASSED ✓" : "FAILED ✗");
        printf("-------------------\n");
    }
}

void test_strcpy(void) {
    printf("\n=== Testing ft_strcpy ===\n");
    const char *test_strings[] = {
        "hello",
        "world",
        "",
        "Testing longer string with spaces"
    };
    
    char buf_lib[100];
    char buf_ft[100];
    
    for (int i = 0; i < sizeof(test_strings) / sizeof(char*); i++) {
        strcpy(buf_lib, test_strings[i]);
        ft_strcpy(buf_ft, test_strings[i]);
        
        printf("Original:  \"%s\"\n", test_strings[i]);
        printf("libc strcpy: \"%s\"\n", buf_lib);
        printf("ft_strcpy:   \"%s\"\n", buf_ft);
        printf("Test %s\n", (strcmp(buf_lib, buf_ft) == 0) ? "PASSED ✓" : "FAILED ✗");
        printf("-------------------\n");
    }
}

void test_strcmp(void) {
    printf("\n=== Testing ft_strcmp ===\n");
    struct {
        char *s1;
        char *s2;
    } test_pairs[] = {
        {"hello", "hello"},
        {"hello", "world"},
        {"abc", "abcd"},
        {"", ""},
        {"test", ""},
        {"abc", "ABC"}
    };
    
    for (int i = 0; i < sizeof(test_pairs) / sizeof(test_pairs[0]); i++) {
        int lib_result = strcmp(test_pairs[i].s1, test_pairs[i].s2);
        int ft_result = ft_strcmp(test_pairs[i].s1, test_pairs[i].s2);
        
        printf("Comparing \"%s\" with \"%s\"\n", test_pairs[i].s1, test_pairs[i].s2);
        printf("libc strcmp: %d\n", lib_result);
        printf("ft_strcmp:   %d\n", ft_result);
        printf("Test %s\n", ((lib_result > 0 && ft_result > 0) || 
                            (lib_result < 0 && ft_result < 0) || 
                            (lib_result == 0 && ft_result == 0)) ? "PASSED ✓" : "FAILED ✗");
        printf("-------------------\n");
    }
}

void test_read_write(void) {
    printf("\n=== Testing ft_read and ft_write ===\n");
    
    // Test write
    const char *test_str = "Testing ft_write function\n";
    printf("Standard write output: ");
    write(1, test_str, strlen(test_str));
    printf("ft_write output: ");
    ft_write(1, test_str, strlen(test_str));
    
    // Test read
    char buf_lib[1024] = {0};
    char buf_ft[1024] = {0};
    
    // Open file for reading
    int fd = open("file.txt", O_RDONLY);
    if (fd < 0) {
        printf("Error: Could not open test file\n");
        return;
    }
    
    ssize_t lib_read = read(fd, buf_lib, 1023);
    close(fd);
    
    fd = open("file.txt", O_RDONLY);
    ssize_t my_ft_read = ft_read(fd, buf_ft, 1023);
	printf("my_ft_read: %zd\n", my_ft_read);
    close(fd);
    
    printf("\nRead test:\n");
    printf("libc read: %zd bytes: \"%s\"\n", lib_read, buf_lib);
    printf("ft_read:   %zd bytes: \"%s\"\n", my_ft_read, buf_ft);
    printf("Test %s\n", (strcmp(buf_lib, buf_ft) == 0) ? "PASSED ✓" : "FAILED ✗");
}

void test_strdup(void) {
    printf("\n=== Testing ft_strdup ===\n");
    const char *test_strings[] = {
        "hello",
        "",
        "This is a test string",
        "Special chars: !@#$%^&*()"
    };
    
    for (int i = 0; i < sizeof(test_strings) / sizeof(char*); i++) {
        char *lib_dup = strdup(test_strings[i]);
        char *ft_dup = ft_strdup(test_strings[i]);
        
        printf("Original:     \"%s\"\n", test_strings[i]);
        printf("libc strdup:  \"%s\"\n", lib_dup);
        printf("ft_strdup:    \"%s\"\n", ft_dup);
        
        if (ft_dup == NULL) {
            printf("ft_strdup returned NULL!\n");
        } else {
            printf("Test %s\n", (strcmp(lib_dup, ft_dup) == 0) ? "PASSED ✓" : "FAILED ✗");
        }
        
        free(lib_dup);
        free(ft_dup);
        printf("-------------------\n");
    }
}

int main(void) {
    test_strlen();
    test_strcpy();
    test_strcmp();
    test_read_write();
    test_strdup();
    
    return 0;
}