all:
	fasm vec.asm
	gcc main.c vec.o -o main