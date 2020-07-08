	global _ft_list_remove_if
	section .text
extern _free

ft_remove_first_one:
	mov	rdi, [rdx]	; rdi = *lst
	push rdi
	mov	rdi, [rdi]	; rdi = *lst->data
	push rdx
	push rcx
	push r8
	push r9
	call r9			; (*free_fct)(*lst->data)
	pop r9
	pop r8
	pop rcx
	pop rdx

	pop rdi ; rdi = *lst
	mov	rsi, QWORD [rdi + 8]
	mov [rdx], rsi		; *lst = *lst->next;

	push rdx
	push rcx
	push r8
	push r9
	call _free			; free(*lst)
	pop r9
	pop r8
	pop rcx
	pop rdx

	ret

_ft_list_remove_if:
	; rdi/rsi = empty so I can call without push too much
	; rdx = **lst, rcx = data_ref, r8 = (*cmp)(), r9 = (*free_fct)()
	mov r9, rcx
	mov r8, rdx
	mov rcx, rsi
	mov rdx, rdi

delete_first_loop:
	mov	rdi, QWORD [rdx]
	cmp	rdi, QWORD 0
	je	delete_first_loop_end
	mov	rdi, QWORD [rdi]
	mov	rsi, rcx

	push rdx
	push rcx
	push r8
	push r9			; (*cmp)(*lst->data, data_ref);
	call r8
	pop r9
	pop r8
	pop rcx
	pop rdx

	cmp rax, 0
	jne	delete_first_loop_end
	call ft_remove_first_one
	jmp	delete_first_loop
delete_first_loop_end:

return:
	ret
