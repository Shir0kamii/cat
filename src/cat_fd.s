section .bss
buffer:	resb 0x1000

section .text:
	global cat_fd

cat_fd:				; int[rax] cat_fd(int[ebx] fd)
	mov	ecx, buffer
	mov	edx, 0x1000
	;; mov 	ebx, fd
	mov	eax, 0x3
	int	0x80		; read(fd, buffer, 4096)

	test	eax, eax
	jle	.endFile

	push 	ebx

	mov	ebx, 0x1
	mov	edx, eax
	mov	eax, 0x4
	int	0x80

	pop	ebx

	jmp	cat_fd

.endFile:
	ret
