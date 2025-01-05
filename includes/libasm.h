#ifndef LIBASM_H
#define LIBASM_H

#include <stdio.h>
#include <string.h>
#include <unistd.h>

extern size_t 	ft_strlen(const char *str);
extern char		*ft_strcpy(char *dest, const char *src);
extern int 		ft_strcmp(const char *str1, const char *str2);
extern ssize_t 	ft_write(int fd, const void *buf, size_t nbyte);
extern ssize_t 	ft_read(int fd, void *buf, size_t nbyte);
extern char 	*ft_strdup(const char *s1);

#endif