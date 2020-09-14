	global _ft_strlen
	section .text

_ft_strlen:
	mov		rax, rdi

ft_strlen_nextchar:
	cmp		[rax], byte 0
	je		ft_strlen_end
	inc		rax
	jmp		ft_strlen_nextchar

ft_strlen_end:
	sub		rax, rdi
	ret
