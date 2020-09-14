	global	_ft_list_size
	section	.text

_ft_list_size:
		xor		rax, rax		; count = 0;

_ft_lstsize_count:
		cmp		rdi, 0			; lst == NULL ? return : count;
		je		_ft_lstsize_end
		mov		rdi, [rdi + 8]	; lst = lst->next;
		inc		rax				; count++;
		jmp		_ft_lstsize_count

_ft_lstsize_end:
		ret
