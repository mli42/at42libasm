	global _ft_strcmp
	section .text

_ft_strcmp:

_ft_str_do_cmp:
	mov		r8b, [rdi]
	cmp		[rsi], r8b
	jg		_ft_strcmp_end_mone
	jl		_ft_strcmp_end_one
	cmp		[rsi], byte 0
	je		_ft_strcmp_end_z
	inc		rdi
	inc		rsi
	jmp		_ft_str_do_cmp

_ft_strcmp_end_one:
	mov		rax, 1
	ret

_ft_strcmp_end_mone:
	mov		rax, -1
	ret

_ft_strcmp_end_z:
	mov		rax, 0
	ret
