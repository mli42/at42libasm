extern	_malloc
extern	___error

		global	_ft_list_push_front
		section	.text

_ft_list_push_front:
		push	rdi				; push begin
		push	rsi				; push data

		mov		rdi, 16			; int size = sizeof(t_list) == 16;
		call	_malloc			; rax = malloc(size);
		cmp		rax, 0			; if (rax == NULL) -> return ;
		jz		exit_error

		pop		rsi				; pop data
		pop		rdi				; pop begin

		mov		[rax], rsi		; lstnew->data = data
		mov		rsi, [rdi]
		mov		[rax + 8], rsi	; lstnew->next = *begin

		mov		[rdi], rax		; *begin = lstnew
		ret

exit_error:
		push	rax				; crash if I do 'mov rax, 0'
		call	___error
		mov		QWORD [rax], 12
		pop		rax
		ret
