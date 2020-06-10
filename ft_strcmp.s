	global _ft_strcmp
	section .text

_ft_strcmp:
		cmp byte [rdi], 0
		je end

		cmpsb			; cmp rdi, rsi and THEN inc them
		je _ft_strcmp	; if equal, reloop

		dec rdi
		dec rsi

end:
		movzx rax, byte [rdi]
		movzx rcx, byte [rsi]
		sub rax, rcx
		ret
