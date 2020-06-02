		global _ft_write
		extern ___error
		section .text

_ft_write:
		mov		rax, 0x02000004
		syscall
		jc		exit_error
		ret
exit_error:
		push	rax
		call	___error
		pop		QWORD [rax]
		mov		rax, -1
		ret
