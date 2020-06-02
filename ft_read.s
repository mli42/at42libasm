# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/27 16:01:12 by mli               #+#    #+#              #
#    Updated: 2020/06/02 14:27:03 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		global _ft_read
		extern ___error
		section .text

_ft_read:
		mov		rax, 0x02000003
		syscall
		jc		exit_error
		ret
exit_error:
		push	rax
		call	___error
		pop		QWORD [rax]
		mov		rax, -1
		ret
