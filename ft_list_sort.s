# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_sort.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/14 11:37:59 by mli               #+#    #+#              #
#    Updated: 2020/09/14 11:42:42 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	global ft_list_sort
	section .text
extern ft_list_size

ft_list_sort:
	; rdi/rsi = empty so I can call without push too much
	; rdx = **lst, rcx = (*cmp)(), r8 = lstsize
	push rsi
	push rdi
	mov	rdi, [rdi]	; rdi = *lst
	call ft_list_size ; list_size(*lst);
	mov r8, rax ; r8 = listsize
	pop rdx ; rdx = rdi == t_list **lst
	pop rcx ; rcx = rsi == (*cmp)()

	inc	r8
lstsort_mainloop:
	dec	r8
	cmp	r8, 0
	jle	return
	call lst_do_sort ; while (lstsize-- > 0) do_sort();
	jmp	lstsort_mainloop

lst_do_sort:
sort_first_loop:
	mov	rdi, QWORD [rdx] ; rdi = *lst
	cmp	rdi, QWORD 0	; if (!*lst) return
	je	return
	mov	rsi, QWORD [rdi + 8] ; rsi = *lst->next
	cmp	rsi, QWORD 0	; if (!*lst->next) return
	je	return
	mov	rdi, QWORD [rdi] ; rdi = *lst->data
	mov	rsi, QWORD [rsi] ; rsi = *lst->next->data

	push rdx
	push rcx
	push r8
	call rcx			; (*cmp)(*lst->data, *lst->next->data);
	pop r8
	pop rcx
	pop rdx

	cmp rax, 0
	jng	sort_first_loop_end ; if (cmp() > 0) swap() ;
	call ft_sort_first_one
sort_first_loop_end:

	; Sort other middle link
	mov	r9, [rdx] ; current = *begin_lst;
sort_other_loop:
	cmp	r9, 0		; while (current != NULL)
	je	sort_other_loop_end
	mov	rdi, QWORD [r9 + 8]	; while ((rdi = current->next))
	cmp rdi, 0
	je	sort_other_loop_end
	mov	rsi, QWORD [rdi + 8]; while ((rsi = current->next->next))
	cmp rsi, QWORD 0
	je	sort_other_loop_end

	mov	rdi, QWORD [rdi] ; rdi = current->next->data
	mov	rsi, QWORD [rsi] ; rsi = current->next->next->data

	push rdx
	push rcx
	push r8
	push r9
	call rcx		; (*cmp)(current->next->data, current->next->next->data);
	pop r9
	pop r8
	pop rcx
	pop rdx

	cmp rax, 0
	jng	sort_other_loop_inc
	call ft_sort_one_other
	jmp	sort_other_loop_inc
sort_other_loop_end:
	jmp	return

return:
	ret

sort_other_loop_inc:
	mov r9, [r9 + 8] ; current = current->next;
	jmp	sort_other_loop

ft_sort_first_one:
	mov	rdi, [rdx]	; rdi = *head (H)
	mov r10,  rdi ; r10 = *head (H)
	mov	rdi, [rdi + 8]	; rdi = *head->next (1)
	mov	rsi, QWORD [rdi + 8] ; rsi = *head->next->next (2)

	mov [r10 + 8], rsi	; *head->next (H->next) = *lst->next->next (2)
	mov	[rdx], QWORD rdi	; *head (H) = *head->next (1)
	mov [rdi + 8], r10 ; *head->next->next (1->next) = *head (H)
	ret

ft_sort_one_other:
	mov	rdi, r9	; rdi = current (H)
	mov	rdi, [rdi + 8]	; rdi = current->next (1)
	mov	rsi, QWORD [rdi + 8]; rsi = current->next->next; (2)
	mov	r10, QWORD [rsi + 8]; r10 = current->next->next->next; (3)

	mov [r9 + 8], rsi	; (H->next) = current->next->next (2)
	mov [rsi + 8], rdi	; (2)->next = (1)
	mov [rdi + 8], r10	; (1)->next = (3)
	ret
