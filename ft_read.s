		global _ft_read
		extern ___error
		section .text

_ft_read:
		mov		rax, 0x02000003
		syscall
		jc		exit_error
		ret
exit_error:
		push	rax
		call	___error
		pop		QWORD [rax]
		mov		rax, -1
		ret
