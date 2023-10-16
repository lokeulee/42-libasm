all:
	nasm -f macho64 hello_world.asm -o hello_world.o && ld -macosx_version_min 10.7.0 -lSystem -o hello_world hello_world.o -e _start
run1: 
	./hello_world

src: strlen.asm strcpy.asm strcmp.asm
	# nasm -f macho64 strlen.asm -o strlen.o && ld -macosx_version_min 10.7.0 -lSystem -o strlen strlen.o -e _start
	nasm -f macho64 strcmp.asm -o strcmp.o && nasm -f macho64 strcpy.asm -o strcpy.o && nasm -f macho64 strlen.asm -o strlen.o && gcc strcmp.o strlen.o strcpy.o main.c && ./a.out

run2:
	./strlen