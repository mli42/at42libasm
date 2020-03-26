		global _ft_write
		section .text

_ft_write:
		push	rcx
		push	rdx
		mov		rax, 0x02000004
		syscall
		pop		rdx
		mov		rcx, -1
		cmp		rax, rdx
		cmovne	rax, rcx
		pop		rcx
		ret
