# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_size.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/14 11:37:48 by mli               #+#    #+#              #
#    Updated: 2020/09/14 11:37:56 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	global	ft_list_size
	section	.text

ft_list_size:
		xor		rax, rax		; count = 0;

_ft_lstsize_count:
		cmp		rdi, 0			; lst == NULL ? return : count;
		je		_ft_lstsize_end
		mov		rdi, [rdi + 8]	; lst = lst->next;
		inc		rax				; count++;
		jmp		_ft_lstsize_count

_ft_lstsize_end:
		ret
