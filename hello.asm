global _start

section .text

_start:
	mov rax, 1   	; write(
	mov rdi, 1   	; 	stdout_FILENO,
	mov rsi, msg 	; 	"Hello, World!\n",
	mov rdx, msglen ; 	sizeof("Hello, World!\n")
	syscall		; );

	mov rax, 60	; exit(
	mov rdi, 0	; 	EXIT_SUCCESS
	syscall		; );

section .rodata
	msg: db "Hello, World!", 0xa
	msglen: equ $ - msg
