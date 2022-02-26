.PHONY: all

all:
	nasm -f elf64 -F dwarf -g readfile.asm
	ld readfile.o -o readfile