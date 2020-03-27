# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/27 16:01:12 by mli               #+#    #+#              #
#    Updated: 2020/03/27 16:01:44 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		global _ft_read
		section .text

_ft_read:
		push	rdx
		mov		rax, 0x02000003
		syscall
		pop		rdx
		cmp		rax, rdx
		jne		_ft_read_error
		ret

_ft_read_error:
		mov		rax, -1
		ret
