section .test
	global _start

	extern cat_fd

_start:
	pop	rax

	cmp	rax, 0x1 	; if (argc <= 1)
	jle	.withoutArg
.withArg:

.withoutArg:
	xor	rbx, rbx
	call 	cat_fd

.exitCode:
	mov	rbx, 0x0
.exit:
	mov	rax, 0x1
	int	0x80
