		  global  _start
		  section .text
_start:	  mov 	  dx, output 	  ; rdx holds address of next bytes to write
		  mov 	  r8, 1        	  ; initialize line legnth
		  mov  	  r9, 0       	  ; number of stars written on line so far

line:	  mov	  byte [rdx], '*' ; write single star
		  inc 	  rdx          	  ; increment address (pointer) of next byte to write
		  inc     r9           	  ; "count" number so far on line
		  cmp 	  r9, r8       	  ; if number of stars on line is less than line length
		  jne	  line		 	  ; then go to line

lineDone: mov	  byte [rdx], 10  ; write a new line char (10 = '\n' in ASCII)
		  inc 	  rdx          	  ; increment address (pointer) of next byte to write
		  inc	  r8			  ; next line will be one char longer
		  mov 	  r9, 0		  	  ; reset number of stars written on line
		  cmp 	  r8, maxlines	  ; wait, did we already finish the last line?
		  jng	  line 			  ; if not, go to line

done:	  mov 	  rax, 1		  ; system call for "write"
		  mov 	  rdi, 1		  ; file descriptor for stdout
		  mov 	  rsi, output	  ; address of string to ouput
		  mov 	  rdx, dataSize   ; number of bytes to write
		  syscall

		  mov 	  rax, 60		  ; system call for "exit"
		  xor	  rdi, rdi		  ; exit code 0
		  syscall

		  section .bss
maxlines  equ	  8
dataSize  equ	  44
output    resb	  dataSize