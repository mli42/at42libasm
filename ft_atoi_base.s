	global _ft_atoi_base
	section .text

	; is_white_space according to `man isspace`
ft_isspace_rdx:
	cmp [rdx], byte 9
	je	retone
	cmp [rdx], byte 10
	je	retone
	cmp [rdx], byte 11
	je	retone
	cmp [rdx], byte 12
	je	retone
	cmp [rdx], byte 13
	je	retone
	cmp [rdx], byte 32
	je	retone
	jmp retzero

; rdi = str || rsi = base
_ft_atoi_base:

ft_base_check:
	; No char to convert so res = 0
	cmp	[rdi], byte 0
	jz	retzero
	; Base len is 0 or 1
	cmp	[rsi], byte 0
	jz	error_exit
	cmp	[rsi + 1], byte 0
	jz	error_exit

	; Check if contains white spaces
	mov rdx, rsi
ft_nowhitespace:
	call ft_isspace_rdx
	cmp rax, 1
	je	error_exit

	inc	rdx
	cmp	[rdx], byte 0
	jne	ft_nowhitespace

	mov rax, 42
	ret

retzero:
error_exit:
	mov rax, 0
	ret

retone:
	mov rax, 1
	ret
