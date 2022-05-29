#!/bin/bash

nasm -f elf64 -o hello.o hello.asm
ld -s -o hello hello.o