	global _ft_atoi_base
	section .text

	; is_white_space according to `man isspace` (+) {+/-}
ft_is_forbidden_char_rdx:
	cmp [rdx], byte 43 ; +
	je	retone
	cmp [rdx], byte 45 ; -
	je	retone
ft_is_whitespace:
	cmp [rdx], byte 9 ; \t
	je	retone
	cmp [rdx], byte 10;	\n
	je	retone
	cmp [rdx], byte 11;	\v
	je	retone
	cmp [rdx], byte 12;	\f
	je	retone
	cmp [rdx], byte 13;	\r
	je	retone
	cmp [rdx], byte 32;	sp
	je	retone
	jmp retzero

	; ret the index of the char searched in the string, -1 if not here
	; rdi = str, rsi = c
_ft_strichr:
	xor rax, rax
ft_strichr_loop:
	movzx r10, byte [rdi + rax]

	cmp	r10, rsi
	je	return
	cmp	r10, byte 0
	je	retminus_one
	inc	rax
	jmp	ft_strichr_loop

return:
	ret

ft_base_check:
	; No char to convert so res = 0
	cmp	[rdi], byte 0
	jz	retzero
	; Base len is 0 or 1
	cmp	[rsi], byte 0
	jz	error_exit
	cmp	[rsi + 1], byte 0
	jz	error_exit

	; Check if contains white spaces (+) {+/-}
	mov rdx, rsi
ft_no_forbidden_c:
	call ft_is_forbidden_char_rdx
	cmp rax, 1
	je	error_exit

	inc	rdx
	cmp	[rdx], byte 0
	jne	ft_no_forbidden_c

	; rdi = base + i + 1, rsi = base[i]
	mov rdi, rsi
ft_no_same_c:
	cmp [rdi + 1], byte 0
	jz	retone		; check is finished
	movzx	rsi, byte [rdi]
	inc	rdi
	call _ft_strichr
	cmp rax, byte -1
	jne	retzero		; the char is here twice
	jmp	ft_no_same_c

; rdi = str || rsi = base
_ft_atoi_base:
	push rdi
	push rsi
	call ft_base_check
	pop	rsi
	pop	rdi

	cmp	rax, 0
	jz	retzero

	mov rax, 42
	ret

retzero:
error_exit:
	mov rax, 0
	ret

retone:
	mov rax, 1
	ret

retminus_one:
	mov rax, -1
	ret
