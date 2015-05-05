section .data
	errorMsg db "Error: The file couldn't be opened", 0xa
	lenErrorMsg equ $ - errorMsg

section .text
	global cat_file

	extern cat_fd

cat_file:			; int[eax] cat_file(char*[rdi] filename)
	mov	ebx, edi
	xor	ecx, ecx
	xor	edx, edx
	mov	eax, 0x5
	int	0x80		; fd = open(filename, O_RDONLY)

	test	eax, eax
	jl	.errorGestion

	mov	ebx, eax
	call	cat_fd

	mov	eax, 0x6
	int	0x80		; close(fd)

	jmp	.endValue	; return 0;

.errorGestion:
	mov	ebx, 0x2
	mov	ecx, errorMsg
	mov	edx, lenErrorMsg
	mov	eax, 0x4
	int	0x80

	mov	eax, 0x1
	jmp	.end

.endValue:
	xor	eax, eax

.end:
	ret
