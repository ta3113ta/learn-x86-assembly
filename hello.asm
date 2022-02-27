	global 	_start

	section .text
_start: 
	mov		rax, 1     		    ; system call for write
	mov		rdi, 1   	        ; file handle 1 is stdout
	mov		rsi, msg 		    ; address of string to output
	mov		rdx, msglen 	    ; sizeof("Hello, World!\n")
	syscall

	mov		rax, 60		        ; system call for exit
	xor		rdi, rdi		    ; exit code 0
	syscall   

	section .data
msg: 	db		"Hello, World!", 10 ; 10 is '\n' (ascii)
msglen: equ		$ - msg
