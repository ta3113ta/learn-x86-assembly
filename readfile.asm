	global _start	; _start is our entry point - this is its declaration...

	section .text	; the text section is where we'll put executable code
_start:		
	mov 	rax, 2	; "open" syscall
	mov 	rdi, path	; argument 1: path
	xor 	rsi, rsi	; argument 2: flags (0 = O_RDONLY)
	syscall

	push 	rax	; save the file descriptor onto stack
	sub 	rsp, 16	; allocate 16 bytes on stack for the arguments

read_buffer:
	xor 	rax, rax	; "read" syscall
	mov 	rdi, [rsp+16]	; argument 1: file descriptor
	mov 	rsi, rsp	; argument 2: address of buffer
	mov 	rdx, 16	; argument 3: number of bytes to read
	syscall

	test 	rax, rax	; if `rax` is 0, we're done
	jz	 	exit	; jz is a jump-if-zero instruction

	; `rax` contains the number of bytes read
	; write takes the number of bytes to write via `rdx`
	mov		rdx, rax	; number of bytes
	mov		rax, 1	; "write" syscall
	mov		rdi, 1	; argument 1: file descriptor
	mov		rsi, rsp	; argument 2: address of buffer
	syscall

	jmp		read_buffer	; loop back to read_buffer
exit:
	mov		rax, 60	; syscall number for "exit"
	xor		rdi, rdi	; return with code 0
	syscall

	section .data
path:	db	"/etc/hosts", 0 ; null terminated string