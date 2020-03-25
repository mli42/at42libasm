		global _ft_write
		section .text

_ft_write:
		mov		r8, -1
		push	rdx
		mov		rax, 0x02000004
		syscall
		pop		rdx
		cmp		rax, rdx
		cmovne	rax, r8
		ret
