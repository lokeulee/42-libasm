NAME			= asm.out

NASM			= nasm
GCC				= gcc

NASM_FLAGS		= -f macho64
CC_FLAGS		= -o
RM				= rm -rf

LIB				= libasm.a
LIB_FLAGS		= -L. -lasm

SRCS_DIR		= ./src
OBJS_DIR		= ./obj

SRCS			= 	strlen.asm strcpy.asm strcmp.asm \
						write.asm read.asm strdup.asm
OBJS			= $(SRCS:%.asm=$(OBJS_DIR)/%.o)

INCLUDES		= -Iincludes

all: $(NAME)

$(NAME): $(OBJS) main.c
			$(GCC) $(OBJS) main.c $(INCLUDES) -o $@


$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.asm
		mkdir -p $(OBJS_DIR)
		$(NASM) $(NASM_FLAGS) $(INCLUDES) $< -o $@

lib: $(OBJS)
	$(NASM) $(NASM_FLAGS) $(INCLUDES) $< -o $@
	ar rcs $(LIB) $(OBJS)

test: re
	./asm.out

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME) $(OBJS_DIR)

re: clean all

.PHONY: clean re