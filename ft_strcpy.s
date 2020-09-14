	global _ft_strcpy
	section .text

_ft_strcpy:
	push	rdi

ft_str_do_cpy:
	movsb
	cmp		[rsi - 1], byte 0
	je		ft_strcpy_end
	jmp		ft_str_do_cpy

ft_strcpy_end:
	pop		rax
	ret

