section .test
	global _start
_start:
.exit:
	mov	rax, 0x1
	mov	rbx, 0x0
	int	0x80
