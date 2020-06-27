# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_push_front_bonus.s                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/27 22:26:34 by mli               #+#    #+#              #
#    Updated: 2020/06/27 22:26:09 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

extern	_malloc

		global	_ft_list_push_front
		section	.text

_ft_list_push_front:
		push	rdi				; push begin
		push	rsi				; push data

		mov		rdi, 16			; int size = sizeof(t_list) == 16;
		call	_malloc			; rax = malloc(size);
		cmp		rax, 0			; if (rax == NULL) -> return ;
		jz		_ft_list_push_front_end

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
