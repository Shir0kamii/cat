section .test
	global _start

	extern cat_fd
	extern cat_file

_start:
	pop 	eax

	cmp 	eax, 0x1 	; if (argc <= 1)
	jle	.withoutArg
.withArg:
	add	esp, 0x4	; jump argv[0]

.loop:
	pop	edi

	test	edi, edi
	je	.exitCode

	call	cat_file

	jmp	.loop

.withoutArg:
	mov	ebx, 0x0
	call 	cat_fd

.exitCode:
	mov	eax, 0x0
.exit:
	mov	eax, 0x1
	int	0x80
