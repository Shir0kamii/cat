section .test
	global _start

	extern cat_fd
	extern cat_files
	extern cat_file

_start:
	pop 	eax

	cmp 	eax, 0x1 	; if (argc <= 1)
	jle	.withoutArg
.withArg:
	pop	edi
	pop	edi

	call	cat_file

	jmp	.exit

.withoutArg:
	mov	ebx, 0x0
	call 	cat_fd

.exitCode:
	mov	eax, 0x0
.exit:
	mov	eax, 0x1
	int	0x80
