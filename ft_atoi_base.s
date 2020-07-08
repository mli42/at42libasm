	global _ft_atoi_base
	section .text

	; is_white_space according to `man isspace` (+) {+/-}
ft_is_forbidden_char:
	call ft_is_sign
	cmp	rax, 1
	je	return
	jmp	ft_is_whitespace
ft_is_sign:
	cmp [rdi], byte 43 ; +
	je	retone
	cmp [rdi], byte 45 ; -
	je	retone
	jmp	retzero
ft_is_whitespace:
	cmp [rdi], byte 9 ; \t
	je	retone
	cmp [rdi], byte 10;	\n
	je	retone
	cmp [rdi], byte 11;	\v
	je	retone
	cmp [rdi], byte 12;	\f
	je	retone
	cmp [rdi], byte 13;	\r
	je	retone
	cmp [rdi], byte 32;	sp
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
	mov rdi, rsi
ft_no_forbidden_c:
	call ft_is_forbidden_char
	cmp rax, 1
	je	error_exit

	inc	rdi
	cmp	[rdi], byte 0
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

	dec rdi
skip_whsp:
	inc rdi
	call ft_is_whitespace
	cmp	rax, 1
	je	skip_whsp

	dec rdi
	mov r10, 1
skip_signs:
	inc rdi
	call ft_is_sign
	cmp	rax, 1
	jne	end_skip_signs
	cmp [rdi], byte 45 ; str[i] == '-' ?
	jne	skip_signs_not_neg
	neg	r10
skip_signs_not_neg:
	jmp	skip_signs		; to delete if do not want a loop for '+-+--+' things
end_skip_signs:

	mov rax, 42 ; tmp

	cmp r10, 1
	je	not_neg
	neg rax
not_neg:

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
