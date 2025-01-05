NAME            = asm.out

NASM            = nasm
GCC             = gcc

NASM_FLAGS      = -f elf64 
RM              = rm -rf
NO_PIE		  	= -no-pie

LIB             = libasm.a
LIB_FLAGS       = -L. -lasm

SRCS_DIR        = ./src
OBJS_DIR        = ./obj

SRCS            = strlen.s strcpy.s strcmp.s \
                    	write.s read.s strdup.s
OBJS            = $(SRCS:%.s=$(OBJS_DIR)/%.o)

INCLUDES        = -Iincludes

all: $(NAME)

$(NAME): $(OBJS) main.c
		$(GCC) $(NO_PIE) $(OBJS) main.c $(INCLUDES) -o $@

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.s
		mkdir -p $(OBJS_DIR)
		$(NASM) $(NASM_FLAGS) $(INCLUDES) $< -o $@

lib: $(OBJS)
		$(NASM) $(NASM_FLAGS) $(INCLUDES) $< -o $@
		ar rcs $(LIB) $(OBJS)

test: re
		./asm.out

clean:
		$(RM) $(OBJS)

fclean:    clean
		$(RM) $(NAME) $(OBJS_DIR)

re: clean all

.PHONY: clean re