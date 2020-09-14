# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_remove_if.s                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/14 11:37:01 by mli               #+#    #+#              #
#    Updated: 2020/09/14 13:39:37 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	global ft_list_remove_if
	section .text
extern free

ft_remove_first_one:
	mov	rdi, [rdx]	; rdi = *lst
	push rdi
	mov	rdi, [rdi]	; rdi = *lst->data
	push rdx
	push rcx
	push r8
	push r9
	call r9			; (*_free_fct)(*lst->data)
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
	call free			; _free(*lst)
	pop r9
	pop r8
	pop rcx
	pop rdx

	ret

ft_remove_one_other:
	mov	rdi, [rdx + 8]	; rdi = current->next
	push rdi
	mov	rdi, [rdi]	; rdi = current->next->data

	push rdx
	push rcx
	push r8
	push r9
	call r9			; (*_free_fct)(current->next->data)
	pop r9
	pop r8
	pop rcx
	pop rdx

	pop rdi ; rdi = current->next
	mov	rsi, QWORD [rdi + 8]; rsi = current->next->next;
	mov [rdx + 8], rsi		; current->next = current->next->next

	push rdx
	push rcx
	push r8
	push r9
	call free			; _free(current->next)
	pop r9
	pop r8
	pop rcx
	pop rdx

	ret

ft_list_remove_if:
	; rdi/rsi = empty so I can call without push too much
	; rdx = **lst, rcx = data_ref, r8 = (*cmp)(), r9 = (*_free_fct)()
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

	; Remove other middle link
	mov	rdx, [rdx] ; current = *begin_lst;
delete_other_loop:
	cmp	rdx, 0		; while (current != NULL)
	je	delete_other_loop_end
	mov	rdi, QWORD [rdx + 8]	; rdi = current->next
	cmp rdi, 0
	je	delete_other_loop_inc
	mov	rdi, [rdi] ; rdi = current->next->data
	mov	rsi, rcx	; rsi = data_ref

	push rdx
	push rcx
	push r8
	push r9			; (*cmp)(current->next->data, data_ref);
	call r8
	pop r9
	pop r8
	pop rcx
	pop rdx

	cmp rax, 0
	jne	delete_other_loop_inc
	call ft_remove_one_other
	jmp	delete_other_loop
delete_other_loop_end:

return:
	ret

delete_other_loop_inc:
	mov rdx, [rdx + 8] ; current = current->next;
	mov	rdi, rdx
	jmp	delete_other_loop
