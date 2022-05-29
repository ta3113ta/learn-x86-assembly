.PHONY: all run

all:
	@echo "use 'make run filename=[target]' instead"

run:
	nasm -f elf64 -F dwarf -g $(filename).asm
	ld $(filename).o -o $(filename)
	./$(filename)
